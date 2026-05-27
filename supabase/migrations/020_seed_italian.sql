-- 020_seed_italian.sql
-- Italian module: 500 quiz questions

-- Question 0 (greeting: ciao) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Ciao" mean?',
         '"Ciao" is an informal greeting used both for "hello" and "goodbye" in Italian.',
         'Hello / Goodbye (informal)',
         '"Ciao" means "hello" or "goodbye" in informal Italian.',
         0
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Hello / Goodbye', true, 0),
       ('Please', false, 1),
       ('Thank you', false, 2),
       ('Excuse me', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 1 (greeting: buongiorno) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "Good morning" in Italian?',
         '"Buongiorno" literally means "good day" and is used as a formal morning/daytime greeting.',
         'Buongiorno',
         '"Good morning" in Italian is "Buongiorno".',
         1
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Buonanotte', false, 0),
       ('Buongiorno', true, 1),
       ('Buonasera', false, 2),
       ('Arrivederci', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 2 (greeting: buonasera) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Buonasera" mean?',
         '"Buonasera" means "good evening" and is used from late afternoon onwards.',
         'Good evening',
         '"Buonasera" means "good evening".',
         2
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Good morning', false, 0),
       ('Good night', false, 1),
       ('Good evening', true, 2),
       ('Good afternoon nap', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 3 (greeting: buonanotte) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "Good night" to Italian.',
         '"Buonanotte" is used when going to bed or saying goodbye late at night.',
         'Buonanotte',
         '"Good night" in Italian is "Buonanotte".',
         3
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Buonasera', false, 0),
       ('Buongiorno', false, 1),
       ('Arrivederci', false, 2),
       ('Buonanotte', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 4 (greeting: arrivederci) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Arrivederci" mean?',
         '"Arrivederci" is a polite/formal way to say "goodbye" in Italian.',
         'Goodbye (formal)',
         '"Arrivederci" means "goodbye" formally.',
         4
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Goodbye (formal)', true, 0),
       ('See you tomorrow', false, 1),
       ('Welcome', false, 2),
       ('Hello there', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 5 (courtesy: per favore) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "Please" in Italian?',
         '"Per favore" literally means "as a favor" and is the standard polite "please".',
         'Per favore',
         '"Please" in Italian is "Per favore".',
         5
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Grazie', false, 0),
       ('Prego', false, 1),
       ('Per favore', true, 2),
       ('Scusa', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 6 (courtesy: grazie) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Grazie" mean?',
         '"Grazie" is the standard Italian way to say "thank you".',
         'Thank you',
         '"Grazie" means "thank you".',
         6
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Please', false, 0),
       ('Thank you', true, 1),
       ('You''re welcome', false, 2),
       ('Sorry', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 7 (courtesy: prego) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Prego" most commonly mean in response to "Grazie"?',
         '"Prego" is the standard reply to "Grazie", meaning "you''re welcome".',
         'You''re welcome',
         '"Prego" means "you''re welcome".',
         7
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Thanks again', false, 0),
       ('Please', false, 1),
       ('You''re welcome', true, 2),
       ('Sorry', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 8 (courtesy: scusa) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Scusa" mean (informal)?',
         '"Scusa" is the informal "excuse me" or "sorry"; the formal form is "Scusi".',
         'Excuse me / Sorry (informal)',
         '"Scusa" means "excuse me" or "sorry" informally.',
         8
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Excuse me (informal)', true, 0),
       ('Thank you', false, 1),
       ('Please', false, 2),
       ('Goodbye', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 9 (greeting: come stai) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you ask "How are you?" informally in Italian?',
         '"Come stai?" uses the informal "tu" form of "stare"; the formal version is "Come sta?".',
         'Come stai?',
         '"How are you?" informally is "Come stai?".',
         9
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Come ti chiami?', false, 0),
       ('Come stai?', true, 1),
       ('Come va?', false, 2),
       ('Dove sei?', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 10 (greeting: mi chiamo) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "My name is..." in Italian?',
         '"Mi chiamo" literally means "I call myself" and is the standard way to introduce yourself.',
         'Mi chiamo...',
         '"My name is..." in Italian is "Mi chiamo...".',
         10
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Io sono di...', false, 0),
       ('Mi piace...', false, 1),
       ('Mi chiamo...', true, 2),
       ('Ho un nome...', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 11 (family: madre) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "madre" mean?',
         '"Madre" means "mother"; "mamma" is the informal "mom".',
         'Mother',
         '"Madre" means "mother".',
         11
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Sister', false, 0),
       ('Grandmother', false, 1),
       ('Aunt', false, 2),
       ('Mother', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 12 (family: padre) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "father" to Italian.',
         '"Padre" means "father"; "papà" is the informal "dad".',
         'Padre',
         '"Father" in Italian is "padre".',
         12
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Padre', true, 0),
       ('Fratello', false, 1),
       ('Nonno', false, 2),
       ('Zio', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 13 (family: fratello) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "fratello" mean?',
         '"Fratello" means "brother"; "sorella" is "sister".',
         'Brother',
         '"Fratello" means "brother".',
         13
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Cousin', false, 0),
       ('Brother', true, 1),
       ('Uncle', false, 2),
       ('Nephew', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 14 (family: sorella) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "sister" to Italian.',
         '"Sorella" means "sister"; plural is "sorelle".',
         'Sorella',
         '"Sister" in Italian is "sorella".',
         14
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Zia', false, 0),
       ('Nonna', false, 1),
       ('Sorella', true, 2),
       ('Cugina', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 15 (family: nonno) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "nonno" mean?',
         '"Nonno" means "grandfather"; "nonna" is "grandmother".',
         'Grandfather',
         '"Nonno" means "grandfather".',
         15
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Father', false, 0),
       ('Grandfather', true, 1),
       ('Uncle', false, 2),
       ('Godfather', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 16 (family: zia) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "zia" mean?',
         '"Zia" means "aunt"; "zio" is "uncle".',
         'Aunt',
         '"Zia" means "aunt".',
         16
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Aunt', true, 0),
       ('Cousin', false, 1),
       ('Niece', false, 2),
       ('Grandma', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 17 (family: cugino) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "cousin (male)" to Italian.',
         '"Cugino" is "male cousin"; "cugina" is the female form.',
         'Cugino',
         '"Male cousin" in Italian is "cugino".',
         17
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Nipote', false, 0),
       ('Cognato', false, 1),
       ('Cugino', true, 2),
       ('Genero', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 18 (family: figlio) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "figlio" mean?',
         '"Figlio" means "son"; "figlia" is "daughter".',
         'Son',
         '"Figlio" means "son".',
         18
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Daughter', false, 0),
       ('Nephew', false, 1),
       ('Cousin', false, 2),
       ('Son', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 19 (family: moglie) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "moglie" mean?',
         '"Moglie" means "wife"; "marito" is "husband".',
         'Wife',
         '"Moglie" means "wife".',
         19
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Wife', true, 0),
       ('Husband', false, 1),
       ('Girlfriend', false, 2),
       ('Mother-in-law', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 20 (food: pane) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "pane" mean?',
         '"Pane" means "bread", a staple of Italian meals.',
         'Bread',
         '"Pane" means "bread".',
         20
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Cheese', false, 0),
       ('Bread', true, 1),
       ('Milk', false, 2),
       ('Wine', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 21 (food: formaggio) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "cheese" to Italian.',
         '"Formaggio" is the general word for cheese.',
         'Formaggio',
         '"Cheese" in Italian is "formaggio".',
         21
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Burro', false, 0),
       ('Latte', false, 1),
       ('Formaggio', true, 2),
       ('Salame', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 22 (food: acqua) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "acqua" mean?',
         '"Acqua" means "water"; "acqua frizzante" is sparkling water.',
         'Water',
         '"Acqua" means "water".',
         22
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Wine', false, 0),
       ('Milk', false, 1),
       ('Juice', false, 2),
       ('Water', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 23 (food: vino) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "vino" mean?',
         '"Vino" means "wine"; "vino rosso" is red wine, "vino bianco" white.',
         'Wine',
         '"Vino" means "wine".',
         23
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Wine', true, 0),
       ('Beer', false, 1),
       ('Vinegar', false, 2),
       ('Coffee', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 24 (food: caffè) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In Italy, ordering "un caffè" gets you what?',
         'In Italy "un caffè" means an espresso by default — not a large American-style coffee.',
         'An espresso',
         '"Un caffè" in Italy means an espresso.',
         24
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A large drip coffee', false, 0),
       ('An espresso', true, 1),
       ('A latte', false, 2),
       ('An americano', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 25 (food: latte) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "latte" mean in Italian?',
         'In Italian "latte" simply means "milk"; ordering "un latte" gets you a glass of milk.',
         'Milk',
         '"Latte" in Italian means "milk".',
         25
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Coffee with milk', false, 0),
       ('Cream', false, 1),
       ('Milk', true, 2),
       ('Yogurt', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 26 (food: pasta) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "la pasta" generally refer to?',
         '"La pasta" generally refers to pasta the dish, though it can also mean dough or paste in other contexts.',
         'Pasta',
         '"La pasta" generally means "pasta".',
         26
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Pasta', true, 0),
       ('Pastry', false, 1),
       ('Pizza', false, 2),
       ('Bread roll', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 27 (food: mela) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "apple" to Italian.',
         '"Mela" means "apple"; plural is "mele".',
         'Mela',
         '"Apple" in Italian is "mela".',
         27
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Pera', false, 0),
       ('Mela', true, 1),
       ('Arancia', false, 2),
       ('Uva', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 28 (food: pesce) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "pesce" mean?',
         '"Pesce" means "fish" (the food/animal).',
         'Fish',
         '"Pesce" means "fish".',
         28
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Peach', false, 0),
       ('Chicken', false, 1),
       ('Fish', true, 2),
       ('Beef', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 29 (food: pollo) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "pollo" mean?',
         '"Pollo" means "chicken" (the food/animal).',
         'Chicken',
         '"Pollo" means "chicken".',
         29
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Chicken', true, 0),
       ('Pork', false, 1),
       ('Lamb', false, 2),
       ('Duck', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 30 (body: testa) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "testa" mean?',
         '"La testa" means "the head".',
         'Head',
         '"Testa" means "head".',
         30
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Hand', false, 0),
       ('Head', true, 1),
       ('Foot', false, 2),
       ('Stomach', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 31 (body: mano) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "la mano" mean?',
         '"La mano" means "the hand". Despite ending in -o, it''s feminine; plural is "le mani".',
         'Hand',
         '"La mano" means "the hand".',
         31
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Arm', false, 0),
       ('Finger', false, 1),
       ('Hand', true, 2),
       ('Wrist', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 32 (body: piede) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "foot" to Italian.',
         '"Piede" means "foot"; plural is "piedi".',
         'Piede',
         '"Foot" in Italian is "piede".',
         32
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Gamba', false, 0),
       ('Ginocchio', false, 1),
       ('Caviglia', false, 2),
       ('Piede', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 33 (body: occhio) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "occhio" mean?',
         '"Occhio" means "eye"; plural is the irregular "occhi".',
         'Eye',
         '"Occhio" means "eye".',
         33
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Ear', false, 0),
       ('Nose', false, 1),
       ('Eye', true, 2),
       ('Mouth', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 34 (body: bocca) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "bocca" mean?',
         '"Bocca" means "mouth".',
         'Mouth',
         '"Bocca" means "mouth".',
         34
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Mouth', true, 0),
       ('Cheek', false, 1),
       ('Lip', false, 2),
       ('Throat', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 35 (body: naso) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "naso" mean?',
         '"Naso" means "nose".',
         'Nose',
         '"Naso" means "nose".',
         35
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Ear', false, 0),
       ('Forehead', false, 1),
       ('Chin', false, 2),
       ('Nose', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 36 (body: braccio) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "braccio" mean?',
         '"Braccio" means "arm"; its plural is the irregular feminine "le braccia".',
         'Arm',
         '"Braccio" means "arm".',
         36
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Arm', true, 0),
       ('Leg', false, 1),
       ('Back', false, 2),
       ('Shoulder', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 37 (body: gamba) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "leg" to Italian.',
         '"Gamba" means "leg"; "In gamba!" idiomatically means "Take care!".',
         'Gamba',
         '"Leg" in Italian is "gamba".',
         37
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Piede', false, 0),
       ('Gamba', true, 1),
       ('Coscia', false, 2),
       ('Spalla', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 38 (body: capelli) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "i capelli" mean?',
         '"I capelli" means "hair" (on one''s head). Italian uses the plural for hair.',
         'Hair',
         '"I capelli" means "hair".',
         38
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Hats', false, 0),
       ('Coats', false, 1),
       ('Hair', true, 2),
       ('Eyelashes', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 39 (body: cuore) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "cuore" mean?',
         '"Cuore" means "heart" (both anatomical and figurative).',
         'Heart',
         '"Cuore" means "heart".',
         39
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Lung', false, 0),
       ('Liver', false, 1),
       ('Brain', false, 2),
       ('Heart', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 40 (color: rosso) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What color is "rosso"?',
         '"Rosso" means "red"; feminine form is "rossa".',
         'Red',
         '"Rosso" means "red".',
         40
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Red', true, 0),
       ('Pink', false, 1),
       ('Orange', false, 2),
       ('Purple', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 41 (color: blu) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "blu" mean?',
         '"Blu" means "blue" and is invariable (it does not change for gender or number).',
         'Blue',
         '"Blu" means "blue".',
         41
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Black', false, 0),
       ('Blue', true, 1),
       ('Brown', false, 2),
       ('Green', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 42 (color: verde) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "verde" mean?',
         '"Verde" means "green"; it ends in -e so it has the same form for masculine and feminine.',
         'Green',
         '"Verde" means "green".',
         42
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Yellow', false, 0),
       ('Blue', false, 1),
       ('Green', true, 2),
       ('Gray', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 43 (color: giallo) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "giallo" mean?',
         '"Giallo" means "yellow"; it''s also the Italian term for the mystery/thriller genre.',
         'Yellow',
         '"Giallo" means "yellow".',
         43
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Orange', false, 0),
       ('Gold', false, 1),
       ('Brown', false, 2),
       ('Yellow', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 44 (color: nero) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "nero" mean?',
         '"Nero" means "black"; feminine "nera".',
         'Black',
         '"Nero" means "black".',
         44
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('White', false, 0),
       ('Black', true, 1),
       ('Gray', false, 2),
       ('Navy', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 45 (color: bianco) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "bianco" mean?',
         '"Bianco" means "white"; feminine "bianca".',
         'White',
         '"Bianco" means "white".',
         45
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Cream', false, 0),
       ('Beige', false, 1),
       ('White', true, 2),
       ('Silver', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 46 (animal: cane) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "cane" mean?',
         '"Cane" means "dog".',
         'Dog',
         '"Cane" means "dog".',
         46
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Cat', false, 0),
       ('Horse', false, 1),
       ('Cow', false, 2),
       ('Dog', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 47 (animal: gatto) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "cat" to Italian.',
         '"Gatto" is "cat" (masculine); "gatta" is the female cat.',
         'Gatto',
         '"Cat" in Italian is "gatto".',
         47
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Cavallo', false, 0),
       ('Gatto', true, 1),
       ('Coniglio', false, 2),
       ('Topo', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 48 (animal: cavallo) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "cavallo" mean?',
         '"Cavallo" means "horse".',
         'Horse',
         '"Cavallo" means "horse".',
         48
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Horse', true, 0),
       ('Donkey', false, 1),
       ('Cow', false, 2),
       ('Sheep', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 49 (animal: uccello) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "uccello" mean?',
         '"Uccello" means "bird".',
         'Bird',
         '"Uccello" means "bird".',
         49
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Fish', false, 0),
       ('Rabbit', false, 1),
       ('Bird', true, 2),
       ('Bee', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 50 (numbers: uno) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What number is "uno"?',
         '"Uno" is the number 1; it also serves as the masculine indefinite article.',
         '1',
         '"Uno" means "one" (1).',
         50
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('1', true, 0),
       ('2', false, 1),
       ('3', false, 2),
       ('11', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 51 (numbers: sette) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What number is "sette"?',
         '"Sette" is the number 7.',
         '7',
         '"Sette" means "seven" (7).',
         51
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('5', false, 0),
       ('6', false, 1),
       ('7', true, 2),
       ('17', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 52 (numbers: dieci) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "ten" in Italian?',
         '"Dieci" is the number 10.',
         'Dieci',
         '"Ten" in Italian is "dieci".',
         52
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Otto', false, 0),
       ('Nove', false, 1),
       ('Undici', false, 2),
       ('Dieci', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 53 (numbers: venti) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What number is "venti"?',
         '"Venti" is the number 20. (Yes, same word as the Starbucks size.)',
         '20',
         '"Venti" means "twenty" (20).',
         53
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('12', false, 0),
       ('20', true, 1),
       ('22', false, 2),
       ('30', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 54 (numbers: cento) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What number is "cento"?',
         '"Cento" is 100; it''s invariable in the simple form.',
         '100',
         '"Cento" means "one hundred" (100).',
         54
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('10', false, 0),
       ('50', false, 1),
       ('100', true, 2),
       ('1000', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 55 (numbers: mille) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What number is "mille"?',
         '"Mille" is 1,000; its plural form is the irregular "mila" (e.g., duemila).',
         '1000',
         '"Mille" means "one thousand" (1000).',
         55
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('100', false, 0),
       ('500', false, 1),
       ('1,000', true, 2),
       ('10,000', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 56 (numbers: tre) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "tre" mean?',
         '"Tre" is the number 3.',
         '3',
         '"Tre" means "three" (3).',
         56
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('2', false, 0),
       ('3', true, 1),
       ('4', false, 2),
       ('13', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 57 (numbers: dodici) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What number is "dodici"?',
         '"Dodici" is the number 12.',
         '12',
         '"Dodici" means "twelve" (12).',
         57
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('2', false, 0),
       ('10', false, 1),
       ('12', true, 2),
       ('20', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 58 (numbers: cinquanta) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What number is "cinquanta"?',
         '"Cinquanta" is the number 50.',
         '50',
         '"Cinquanta" means "fifty" (50).',
         58
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('15', false, 0),
       ('40', false, 1),
       ('50', true, 2),
       ('500', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 59 (numbers: sedici) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What number is "sedici"?',
         '"Sedici" is the number 16.',
         '16',
         '"Sedici" means "sixteen" (16).',
         59
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('6', false, 0),
       ('16', true, 1),
       ('60', false, 2),
       ('600', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 60 (time: che ora è) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you ask "What time is it?" in Italian?',
         '"Che ora è?" or "Che ore sono?" both ask "What time is it?".',
         'Che ora è?',
         '"What time is it?" is "Che ora è?".',
         60
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Che ora è?', true, 0),
       ('Quanto costa?', false, 1),
       ('Dove sei?', false, 2),
       ('Come va?', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 61 (time: mezzogiorno) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "mezzogiorno" mean?',
         '"Mezzogiorno" literally "midday" — i.e., noon. It''s also the name for southern Italy.',
         'Noon',
         '"Mezzogiorno" means "noon".',
         61
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Midnight', false, 0),
       ('Morning', false, 1),
       ('Noon', true, 2),
       ('Sunset', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 62 (time: mezzanotte) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "mezzanotte" mean?',
         '"Mezzanotte" is "midnight".',
         'Midnight',
         '"Mezzanotte" means "midnight".',
         62
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Midnight', true, 0),
       ('Noon', false, 1),
       ('Evening', false, 2),
       ('Dawn', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 63 (time: sono le tre) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "It''s 3 o''clock" in Italian?',
         'For 2-12 o''clock you use the plural "Sono le..." with the feminine plural article "le".',
         'Sono le tre',
         '"It''s 3 o''clock" is "Sono le tre".',
         63
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('È la tre', false, 0),
       ('È tre', false, 1),
       ('Sono le tre', true, 2),
       ('Sono tre', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 64 (time: è l'una) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "It''s 1 o''clock" in Italian?',
         'One o''clock is singular: "È l''una" (it''s one [hour]).',
         'È l''una',
         '"It''s one o''clock" is "È l''una".',
         64
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Sono le una', false, 0),
       ('È l''una', true, 1),
       ('È uno', false, 2),
       ('Sono uno', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 65 (days: lunedì) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What day is "lunedì"?',
         '"Lunedì" is Monday — the first day of the week in the Italian calendar.',
         'Monday',
         '"Lunedì" means "Monday".',
         65
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Sunday', false, 0),
       ('Monday', true, 1),
       ('Tuesday', false, 2),
       ('Friday', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 66 (days: martedì) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What day is "martedì"?',
         '"Martedì" is Tuesday.',
         'Tuesday',
         '"Martedì" means "Tuesday".',
         66
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Monday', false, 0),
       ('Wednesday', false, 1),
       ('Tuesday', true, 2),
       ('Thursday', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 67 (days: mercoledì) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What day is "mercoledì"?',
         '"Mercoledì" is Wednesday (from "Mercurio", Mercury).',
         'Wednesday',
         '"Mercoledì" means "Wednesday".',
         67
  from modules where slug = 'italian'
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

-- Question 68 (days: giovedì) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What day is "giovedì"?',
         '"Giovedì" is Thursday (from "Giove", Jupiter).',
         'Thursday',
         '"Giovedì" means "Thursday".',
         68
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Wednesday', false, 0),
       ('Friday', false, 1),
       ('Thursday', true, 2),
       ('Sunday', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 69 (days: venerdì) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What day is "venerdì"?',
         '"Venerdì" is Friday (from "Venere", Venus).',
         'Friday',
         '"Venerdì" means "Friday".',
         69
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Friday', true, 0),
       ('Saturday', false, 1),
       ('Thursday', false, 2),
       ('Monday', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 70 (days: sabato) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What day is "sabato"?',
         '"Sabato" is Saturday (from Hebrew Shabbat).',
         'Saturday',
         '"Sabato" means "Saturday".',
         70
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Friday', false, 0),
       ('Sunday', false, 1),
       ('Saturday', true, 2),
       ('Thursday', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 71 (days: domenica) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What day is "domenica"?',
         '"Domenica" is Sunday and is feminine (the only feminine day).',
         'Sunday',
         '"Domenica" means "Sunday".',
         71
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Sunday', true, 0),
       ('Monday', false, 1),
       ('Saturday', false, 2),
       ('Holiday', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 72 (months: gennaio) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What month is "gennaio"?',
         '"Gennaio" is January. Italian months are not capitalized.',
         'January',
         '"Gennaio" means "January".',
         72
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('February', false, 0),
       ('January', true, 1),
       ('June', false, 2),
       ('July', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 73 (months: febbraio) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What month is "febbraio"?',
         '"Febbraio" is February.',
         'February',
         '"Febbraio" means "February".',
         73
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('January', false, 0),
       ('March', false, 1),
       ('February', true, 2),
       ('April', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 74 (months: maggio) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What month is "maggio"?',
         '"Maggio" is May.',
         'May',
         '"Maggio" means "May".',
         74
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('March', false, 0),
       ('April', false, 1),
       ('June', false, 2),
       ('May', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 75 (months: agosto) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What month is "agosto"?',
         '"Agosto" is August — the month most Italians take vacation.',
         'August',
         '"Agosto" means "August".',
         75
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('August', true, 0),
       ('April', false, 1),
       ('October', false, 2),
       ('July', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 76 (months: dicembre) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What month is "dicembre"?',
         '"Dicembre" is December.',
         'December',
         '"Dicembre" means "December".',
         76
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('November', false, 0),
       ('December', true, 1),
       ('October', false, 2),
       ('September', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 77 (months: ottobre) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What month is "ottobre"?',
         '"Ottobre" is October.',
         'October',
         '"Ottobre" means "October".',
         77
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('August', false, 0),
       ('September', false, 1),
       ('October', true, 2),
       ('November', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 78 (dates: il primo) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "the 1st of May" in Italian?',
         'For the 1st of the month Italian uses the ordinal "il primo"; other dates use cardinals.',
         'Il primo maggio',
         'In Italian "1st of May" is "il primo maggio".',
         78
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Il uno maggio', false, 0),
       ('Il primo maggio', true, 1),
       ('L''una maggio', false, 2),
       ('Maggio uno', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 79 (dates: oggi è) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "Today is Monday" in Italian?',
         'Italian uses the same simple structure: "Oggi è lunedì" — note no capital on the day name.',
         'Oggi è lunedì',
         '"Today is Monday" is "Oggi è lunedì".',
         79
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Oggi è Lunedì.', false, 0),
       ('Ieri è lunedì.', false, 1),
       ('Oggi è lunedì.', true, 2),
       ('Oggi sono lunedì.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 80 (weather: che tempo fa) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you ask "What''s the weather like?" in Italian?',
         '"Che tempo fa?" literally is "What weather does it make?" — Italian uses "fare" for weather.',
         'Che tempo fa?',
         '"What''s the weather like?" is "Che tempo fa?".',
         80
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Che tempo fa?', true, 0),
       ('Come stai?', false, 1),
       ('Dov''è il tempo?', false, 2),
       ('Quanto tempo?', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 81 (weather: fa caldo) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Fa caldo" mean?',
         '"Fa caldo" uses "fare" + adjective for weather: "It''s hot".',
         'It''s hot',
         '"Fa caldo" means "it''s hot".',
         81
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It''s cold', false, 0),
       ('It''s windy', false, 1),
       ('It''s hot', true, 2),
       ('It''s sunny', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 82 (weather: fa freddo) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Fa freddo" mean?',
         '"Fa freddo" means "It''s cold".',
         'It''s cold',
         '"Fa freddo" means "it''s cold".',
         82
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It''s cold', true, 0),
       ('It''s warm', false, 1),
       ('It''s raining', false, 2),
       ('It''s humid', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 83 (weather: piove) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Piove" mean?',
         '"Piove" means "It''s raining" — from the verb "piovere".',
         'It''s raining',
         '"Piove" means "it''s raining".',
         83
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It''s snowing', false, 0),
       ('It''s raining', true, 1),
       ('It''s sunny', false, 2),
       ('It''s cloudy', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 84 (weather: nevica) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Nevica" mean?',
         '"Nevica" means "It''s snowing" — from "nevicare".',
         'It''s snowing',
         '"Nevica" means "it''s snowing".',
         84
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It''s raining', false, 0),
       ('It''s foggy', false, 1),
       ('It''s snowing', true, 2),
       ('It''s thundering', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 85 (weather: c'è il sole) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "C''è il sole" mean?',
         '"C''è il sole" literally "there is the sun" — i.e., "It''s sunny".',
         'It''s sunny',
         '"C''è il sole" means "it''s sunny".',
         85
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It''s windy', false, 0),
       ('It''s sunny', true, 1),
       ('It''s cloudy', false, 2),
       ('There''s a storm', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 86 (weather: c'è vento) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "It''s windy" in Italian?',
         '"C''è vento" means "there is wind" — Italian''s way of saying "It''s windy".',
         'C''è vento',
         '"It''s windy" is "C''è vento".',
         86
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Fa vento', false, 0),
       ('È vento', false, 1),
       ('Vento fa', false, 2),
       ('C''è vento', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 87 (time: stagione) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "stagione" mean?',
         '"Stagione" means "season" (of the year).',
         'Season',
         '"Stagione" means "season".',
         87
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Season', true, 0),
       ('Station', false, 1),
       ('Stadium', false, 2),
       ('Holiday', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 88 (seasons: primavera) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What season is "primavera"?',
         '"Primavera" means "spring".',
         'Spring',
         '"Primavera" means "spring".',
         88
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Summer', false, 0),
       ('Spring', true, 1),
       ('Autumn', false, 2),
       ('Winter', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 89 (seasons: estate) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What season is "estate"?',
         '"Estate" means "summer" (feminine noun).',
         'Summer',
         '"Estate" means "summer".',
         89
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Spring', false, 0),
       ('Winter', false, 1),
       ('Summer', true, 2),
       ('Autumn', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 90 (seasons: autunno) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What season is "autunno"?',
         '"Autunno" means "autumn"/"fall".',
         'Autumn',
         '"Autunno" means "autumn".',
         90
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Autumn', true, 0),
       ('Spring', false, 1),
       ('Winter', false, 2),
       ('Summer', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 91 (seasons: inverno) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What season is "inverno"?',
         '"Inverno" means "winter".',
         'Winter',
         '"Inverno" means "winter".',
         91
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Autumn', false, 0),
       ('Spring', false, 1),
       ('Winter', true, 2),
       ('Summer', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 92 (time: ieri) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "ieri" mean?',
         '"Ieri" means "yesterday".',
         'Yesterday',
         '"Ieri" means "yesterday".',
         92
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Today', false, 0),
       ('Tomorrow', false, 1),
       ('Last week', false, 2),
       ('Yesterday', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 93 (time: oggi) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "oggi" mean?',
         '"Oggi" means "today".',
         'Today',
         '"Oggi" means "today".',
         93
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Today', true, 0),
       ('Yesterday', false, 1),
       ('Tomorrow', false, 2),
       ('Now', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 94 (time: domani) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "domani" mean?',
         '"Domani" means "tomorrow".',
         'Tomorrow',
         '"Domani" means "tomorrow".',
         94
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Today', false, 0),
       ('Tomorrow', true, 1),
       ('Soon', false, 2),
       ('Next year', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 95 (time: mattina) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "mattina" mean?',
         '"Mattina" means "morning"; "di mattina" = "in the morning".',
         'Morning',
         '"Mattina" means "morning".',
         95
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Evening', false, 0),
       ('Night', false, 1),
       ('Morning', true, 2),
       ('Afternoon', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 96 (time: pomeriggio) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "pomeriggio" mean?',
         '"Pomeriggio" means "afternoon".',
         'Afternoon',
         '"Pomeriggio" means "afternoon".',
         96
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Afternoon', true, 0),
       ('Morning', false, 1),
       ('Evening', false, 2),
       ('Noon', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 97 (time: sera) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "sera" mean?',
         '"Sera" means "evening".',
         'Evening',
         '"Sera" means "evening".',
         97
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Night', false, 0),
       ('Evening', true, 1),
       ('Morning', false, 2),
       ('Sunset', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 98 (time: notte) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "notte" mean?',
         '"Notte" means "night".',
         'Night',
         '"Notte" means "night".',
         98
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Day', false, 0),
       ('Dawn', false, 1),
       ('Dusk', false, 2),
       ('Night', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 99 (time: settimana) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "settimana" mean?',
         '"Settimana" means "week".',
         'Week',
         '"Settimana" means "week".',
         99
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Week', true, 0),
       ('Month', false, 1),
       ('Day', false, 2),
       ('Hour', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 100 (verb: parlare io) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "parlare" (to speak) for "io" in the present tense.',
         'Regular -are verbs drop -are and add -o for "io": parlare → parl + o = parlo.',
         'parlo',
         'The "io" form of "parlare" is "parlo".',
         100
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('parlo', true, 0),
       ('parli', false, 1),
       ('parla', false, 2),
       ('parlare', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 101 (verb: parlare tu) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "parlare" for "tu" in the present.',
         'Regular -are verbs add -i for "tu": parl + i = parli.',
         'parli',
         'The "tu" form of "parlare" is "parli".',
         101
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('parla', false, 0),
       ('parli', true, 1),
       ('parlo', false, 2),
       ('parle', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 102 (verb: parlare lui) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "parlare" for "lui/lei" in the present.',
         'Regular -are verbs add -a for "lui/lei": parl + a = parla.',
         'parla',
         'The "lui/lei" form of "parlare" is "parla".',
         102
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('parlo', false, 0),
       ('parli', false, 1),
       ('parla', true, 2),
       ('parle', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 103 (verb: parlare noi) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "parlare" for "noi" in the present.',
         'Regular -are verbs add -iamo for "noi": parl + iamo = parliamo.',
         'parliamo',
         'The "noi" form of "parlare" is "parliamo".',
         103
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('parlamo', false, 0),
       ('parliamo', true, 1),
       ('parlemo', false, 2),
       ('parlano', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 104 (verb: parlare voi) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "parlare" for "voi" in the present.',
         'Regular -are verbs add -ate for "voi": parl + ate = parlate.',
         'parlate',
         'The "voi" form of "parlare" is "parlate".',
         104
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('parlete', false, 0),
       ('parliate', false, 1),
       ('parlate', true, 2),
       ('parlano', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 105 (verb: parlare loro) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "parlare" for "loro" in the present.',
         'Regular -are verbs add -ano for "loro": parl + ano = parlano. Note stress stays on the first syllable.',
         'parlano',
         'The "loro" form of "parlare" is "parlano".',
         105
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('parlano', true, 0),
       ('parleno', false, 1),
       ('parlino', false, 2),
       ('parlonno', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 106 (verb: vendere io) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "vendere" (to sell) for "io" in the present.',
         'Regular -ere verbs drop -ere and add -o for "io": vend + o = vendo.',
         'vendo',
         'The "io" form of "vendere" is "vendo".',
         106
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('vende', false, 0),
       ('vendi', false, 1),
       ('vendo', true, 2),
       ('vendere', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 107 (verb: vedere lui) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "vedere" (to see) for "lui" in the present.',
         '-ere verbs add -e for "lui/lei": ved + e = vede.',
         'vede',
         'The "lui" form of "vedere" is "vede".',
         107
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('vedi', false, 0),
       ('vede', true, 1),
       ('vedo', false, 2),
       ('veda', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 108 (verb: vedere noi) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "vedere" for "noi" in the present.',
         '-ere verbs add -iamo for "noi": ved + iamo = vediamo.',
         'vediamo',
         'The "noi" form of "vedere" is "vediamo".',
         108
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('vediamo', true, 0),
       ('vedemo', false, 1),
       ('vedono', false, 2),
       ('vedete', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 109 (verb: vedere loro) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "vedere" for "loro" in the present.',
         '-ere verbs add -ono for "loro": ved + ono = vedono.',
         'vedono',
         'The "loro" form of "vedere" is "vedono".',
         109
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('vedano', false, 0),
       ('vediano', false, 1),
       ('vedono', true, 2),
       ('vedeno', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 110 (verb: dormire io) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "dormire" (to sleep) for "io" in the present.',
         'Regular -ire verbs drop -ire and add -o for "io": dorm + o = dormo.',
         'dormo',
         'The "io" form of "dormire" is "dormo".',
         110
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('dormo', true, 0),
       ('dormi', false, 1),
       ('dorme', false, 2),
       ('dormisco', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 111 (verb: dormire voi) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "dormire" for "voi" in the present.',
         'Regular -ire verbs add -ite for "voi": dorm + ite = dormite.',
         'dormite',
         'The "voi" form of "dormire" is "dormite".',
         111
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('dormate', false, 0),
       ('dormete', false, 1),
       ('dormite', true, 2),
       ('dormono', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 112 (verb: capire io -isc) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "capire" (to understand) for "io" in the present.',
         '"Capire" is an -isc- -ire verb: cap + isc + o = capisco.',
         'capisco',
         'The "io" form of "capire" is "capisco".',
         112
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('capo', false, 0),
       ('capisco', true, 1),
       ('capi', false, 2),
       ('capio', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 113 (verb: capire noi) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "capire" for "noi" in the present.',
         '"Noi" and "voi" of -isc- verbs do NOT take -isc-: cap + iamo = capiamo.',
         'capiamo',
         'The "noi" form of "capire" is "capiamo".',
         113
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('capisciamo', false, 0),
       ('capischiamo', false, 1),
       ('capiamo', true, 2),
       ('capemo', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 114 (verb: essere io) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "essere" (to be) for "io" in the present.',
         '"Essere" is highly irregular: io sono, tu sei, lui è, noi siamo, voi siete, loro sono.',
         'sono',
         'The "io" form of "essere" is "sono".',
         114
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('sei', false, 0),
       ('è', false, 1),
       ('siamo', false, 2),
       ('sono', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 115 (verb: essere tu) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "essere" for "tu" in the present.',
         'Tu form of "essere" is the irregular "sei".',
         'sei',
         'The "tu" form of "essere" is "sei".',
         115
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('sei', true, 0),
       ('siete', false, 1),
       ('sono', false, 2),
       ('è', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 116 (verb: essere lui) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "essere" for "lui/lei" in the present.',
         'Lui/lei form of "essere" is "è" — note the grave accent distinguishing it from "e" (and).',
         'è',
         'The "lui/lei" form of "essere" is "è".',
         116
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('e', false, 0),
       ('è', true, 1),
       ('sono', false, 2),
       ('si', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 117 (verb: essere voi) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "essere" for "voi" in the present.',
         'Voi form of "essere" is "siete".',
         'siete',
         'The "voi" form of "essere" is "siete".',
         117
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('siamo', false, 0),
       ('sete', false, 1),
       ('siete', true, 2),
       ('sono', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 118 (verb: avere io) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "avere" (to have) for "io" in the present.',
         '"Avere": io ho, tu hai, lui ha, noi abbiamo, voi avete, loro hanno. The h is silent.',
         'ho',
         'The "io" form of "avere" is "ho".',
         118
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('ho', true, 0),
       ('hai', false, 1),
       ('ha', false, 2),
       ('avo', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 119 (verb: avere noi) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "avere" for "noi" in the present.',
         'Noi form of "avere" is "abbiamo".',
         'abbiamo',
         'The "noi" form of "avere" is "abbiamo".',
         119
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('aviamo', false, 0),
       ('abbiamo', true, 1),
       ('avemo', false, 2),
       ('hanno', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 120 (verb: avere loro) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "avere" for "loro" in the present.',
         'Loro form of "avere" is "hanno" — silent h.',
         'hanno',
         'The "loro" form of "avere" is "hanno".',
         120
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('avno', false, 0),
       ('anno', false, 1),
       ('hanno', true, 2),
       ('avono', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 121 (verb: andare io) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "andare" (to go) for "io" in the present.',
         '"Andare": io vado, tu vai, lui va, noi andiamo, voi andate, loro vanno.',
         'vado',
         'The "io" form of "andare" is "vado".',
         121
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('ando', false, 0),
       ('vado', true, 1),
       ('vai', false, 2),
       ('andiamo', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 122 (verb: andare loro) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "andare" for "loro" in the present.',
         'Loro form of "andare" is the irregular "vanno".',
         'vanno',
         'The "loro" form of "andare" is "vanno".',
         122
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('andano', false, 0),
       ('andano', false, 1),
       ('vanno', true, 2),
       ('vano', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 123 (verb: fare io) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "fare" (to do/make) for "io" in the present.',
         '"Fare": io faccio, tu fai, lui fa, noi facciamo, voi fate, loro fanno.',
         'faccio',
         'The "io" form of "fare" is "faccio".',
         123
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('fo', false, 0),
       ('faccio', true, 1),
       ('faro', false, 2),
       ('faccio', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 124 (verb: fare noi) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "fare" for "noi" in the present.',
         'Noi form of "fare" is "facciamo".',
         'facciamo',
         'The "noi" form of "fare" is "facciamo".',
         124
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('faciamo', false, 0),
       ('faciammo', false, 1),
       ('facciamo', true, 2),
       ('fiamo', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 125 (verb: stare io) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "stare" (to stay/be) for "io" in the present.',
         '"Stare": io sto, tu stai, lui sta, noi stiamo, voi state, loro stanno.',
         'sto',
         'The "io" form of "stare" is "sto".',
         125
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('sto', true, 0),
       ('stai', false, 1),
       ('sta', false, 2),
       ('stio', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 126 (verb: stare loro) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "stare" for "loro" in the present.',
         'Loro form of "stare" is "stanno".',
         'stanno',
         'The "loro" form of "stare" is "stanno".',
         126
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('stiano', false, 0),
       ('stanno', true, 1),
       ('stano', false, 2),
       ('staranno', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 127 (verb: dare io) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "dare" (to give) for "io" in the present.',
         '"Dare": io do, tu dai, lui dà, noi diamo, voi date, loro danno.',
         'do',
         'The "io" form of "dare" is "do".',
         127
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('dò', false, 0),
       ('do', true, 1),
       ('dato', false, 2),
       ('darò', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 128 (verb: dare lui) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "dare" for "lui/lei" in the present.',
         'Lui/lei form of "dare" is "dà" with grave accent (distinguishes from preposition "da").',
         'dà',
         'The "lui/lei" form of "dare" is "dà".',
         128
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('da', false, 0),
       ('dai', false, 1),
       ('dà', true, 2),
       ('dare', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 129 (verb meaning: parlo italiano) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Parlo italiano" mean?',
         'Italian doesn''t require a subject pronoun: "Parlo italiano" = "I speak Italian".',
         'I speak Italian',
         '"Parlo italiano" means "I speak Italian".',
         129
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('You speak Italian', false, 0),
       ('I spoke Italian', false, 1),
       ('She speaks Italian', false, 2),
       ('I speak Italian', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 130 (verb meaning: mangio) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "mangio" mean?',
         '"Mangio" is the "io" present form of "mangiare" — note that the -i- is preserved before -o.',
         'I eat',
         '"Mangio" means "I eat".',
         130
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('I eat', true, 0),
       ('I ate', false, 1),
       ('I drink', false, 2),
       ('I want', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 131 (verb: bere io) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "bere" (to drink) for "io" in the present.',
         '"Bere" is irregular; it stems from Latin "bevere": io bevo, tu bevi, lui beve, etc.',
         'bevo',
         'The "io" form of "bere" is "bevo".',
         131
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('bero', false, 0),
       ('bevo', true, 1),
       ('berro', false, 2),
       ('beverò', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 132 (verb: venire io) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "venire" (to come) for "io" in the present.',
         '"Venire": io vengo, tu vieni, lui viene, noi veniamo, voi venite, loro vengono.',
         'vengo',
         'The "io" form of "venire" is "vengo".',
         132
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('vieno', false, 0),
       ('veno', false, 1),
       ('vengo', true, 2),
       ('venio', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 133 (verb: uscire io) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "uscire" (to go out) for "io" in the present.',
         '"Uscire" is irregular: io esco, tu esci, lui esce, noi usciamo, voi uscite, loro escono.',
         'esco',
         'The "io" form of "uscire" is "esco".',
         133
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('esco', true, 0),
       ('usco', false, 1),
       ('escio', false, 2),
       ('uscio', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 134 (verb: potere io) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "potere" (can/to be able to) for "io" in the present.',
         '"Potere": io posso, tu puoi, lui può, noi possiamo, voi potete, loro possono.',
         'posso',
         'The "io" form of "potere" is "posso".',
         134
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('poto', false, 0),
       ('puoto', false, 1),
       ('posso', true, 2),
       ('potero', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 135 (verb: volere io) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "volere" (to want) for "io" in the present.',
         '"Volere": io voglio, tu vuoi, lui vuole, noi vogliamo, voi volete, loro vogliono.',
         'voglio',
         'The "io" form of "volere" is "voglio".',
         135
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('volo', false, 0),
       ('vuolo', false, 1),
       ('vorrò', false, 2),
       ('voglio', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 136 (verb: dovere io) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "dovere" (must/to have to) for "io" in the present.',
         '"Dovere": io devo, tu devi, lui deve, noi dobbiamo, voi dovete, loro devono.',
         'devo',
         'The "io" form of "dovere" is "devo".',
         136
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('devo', true, 0),
       ('dovo', false, 1),
       ('debbo', false, 2),
       ('doverò', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 137 (verb: sapere io) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "sapere" (to know facts) for "io" in the present.',
         '"Sapere": io so, tu sai, lui sa, noi sappiamo, voi sapete, loro sanno.',
         'so',
         'The "io" form of "sapere" is "so".',
         137
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('sappo', false, 0),
       ('so', true, 1),
       ('sao', false, 2),
       ('sapio', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 138 (verb meaning: hai fame) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Hai fame?" mean?',
         'Italian uses "avere" for hunger: "Hai fame?" = literally "Have you hunger?" = "Are you hungry?".',
         'Are you hungry?',
         '"Hai fame?" means "Are you hungry?".',
         138
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Are you tired?', false, 0),
       ('Are you hungry?', true, 1),
       ('Are you cold?', false, 2),
       ('Are you ready?', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 139 (verb meaning: ho sete) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Ho sete" mean?',
         'Italian uses "avere" for thirst: "Ho sete" = "I have thirst" = "I''m thirsty".',
         'I''m thirsty',
         '"Ho sete" means "I''m thirsty".',
         139
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('I''m hot', false, 0),
       ('I''m sleepy', false, 1),
       ('I''m thirsty', true, 2),
       ('I''m happy', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 140 (verb meaning: ho freddo) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Ho freddo" mean?',
         'For body sensations Italians use "avere": "Ho freddo" = "I''m cold" (lit. "I have cold").',
         'I''m cold',
         '"Ho freddo" means "I''m cold".',
         140
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It''s cold', false, 0),
       ('I''m cold', true, 1),
       ('I have a cold', false, 2),
       ('I want a coat', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 141 (verb meaning: ho 20 anni) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "I am 20 years old" in Italian?',
         'Italian uses "avere" for age: "Ho 20 anni" — literally "I have 20 years".',
         'Ho 20 anni',
         '"I''m 20 years old" is "Ho 20 anni".',
         141
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Sono 20 anni', false, 0),
       ('Sono 20', false, 1),
       ('Ho 20 anni', true, 2),
       ('Ho 20 vecchio', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 142 (verb: usage essere vs stare) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which verb completes "Come ___?" (How are you?) in Italian?',
         'For "How are you?" Italian uses "stare", not "essere": "Come stai?".',
         'stai (from stare)',
         '"How are you?" uses "stare": "Come stai?".',
         142
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('sei', false, 0),
       ('hai', false, 1),
       ('vai', false, 2),
       ('stai', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 143 (fill: vado a scuola) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Fill in: "Io ___ a scuola ogni giorno." (I go to school every day.)',
         '"Vado" is the io form of "andare" (to go).',
         'vado',
         'The blank takes "vado" (io andare).',
         143
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('vado', true, 0),
       ('vai', false, 1),
       ('va', false, 2),
       ('andiamo', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 144 (fill: noi siamo) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Fill in: "Noi ___ italiani." (We are Italian.)',
         '"Siamo" is the noi form of "essere".',
         'siamo',
         'The blank takes "siamo" (noi essere).',
         144
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('siete', false, 0),
       ('siamo', true, 1),
       ('sono', false, 2),
       ('abbiamo', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 145 (verb: piacere) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "I like pizza" in Italian?',
         '"Piacere" reverses subject/object: "Mi piace la pizza" literally "Pizza is pleasing to me".',
         'Mi piace la pizza',
         '"I like pizza" is "Mi piace la pizza".',
         145
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Io piaccio la pizza', false, 0),
       ('Io piace la pizza', false, 1),
       ('Mi piace la pizza', true, 2),
       ('La pizza mi vuole', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 146 (verb: piacciono plural) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "I like cats" in Italian?',
         'With "piacere" the verb agrees with what is liked. Plural cats → "piacciono": "Mi piacciono i gatti".',
         'Mi piacciono i gatti',
         '"I like cats" is "Mi piacciono i gatti".',
         146
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Mi piace i gatti', false, 0),
       ('Mi piacciono i gatti', true, 1),
       ('Io piaccio i gatti', false, 2),
       ('A me piace gatti', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 147 (verb: leggere io) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "leggere" (to read) for "io" in the present.',
         'Regular -ere verb: leggo, leggi, legge, leggiamo, leggete, leggono.',
         'leggo',
         'The "io" form of "leggere" is "leggo".',
         147
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('leggi', false, 0),
       ('lego', false, 1),
       ('leggo', true, 2),
       ('leggio', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 148 (verb: scrivere noi) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "scrivere" (to write) for "noi" in the present.',
         'Regular -ere verb: noi scriviamo.',
         'scriviamo',
         'The "noi" form of "scrivere" is "scriviamo".',
         148
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('scrivamo', false, 0),
       ('scriviamo', true, 1),
       ('scrivemo', false, 2),
       ('scriviano', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 149 (verb: tenere io) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "tenere" (to hold/keep) for "io" in the present.',
         '"Tenere": io tengo, tu tieni, lui tiene, noi teniamo, voi tenete, loro tengono.',
         'tengo',
         'The "io" form of "tenere" is "tengo".',
         149
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('teno', false, 0),
       ('tieno', false, 1),
       ('tengo', true, 2),
       ('teneo', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 150 (passato prossimo: ho mangiato) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "I ate" (passato prossimo) to Italian.',
         'Passato prossimo of "mangiare" uses avere + participle: "Ho mangiato".',
         'Ho mangiato',
         '"I ate" in passato prossimo is "Ho mangiato".',
         150
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Sono mangiato', false, 0),
       ('Ho mangiato', true, 1),
       ('Mangiavo', false, 2),
       ('Mangiai', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 151 (passato prossimo: sono andato) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "I went" (masculine subject, passato prossimo) to Italian.',
         'Verbs of motion like "andare" take "essere"; participle agrees with the subject: "Sono andato".',
         'Sono andato',
         '"I went" (m.) in passato prossimo is "Sono andato".',
         151
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Ho andato', false, 0),
       ('Sono andato', true, 1),
       ('Andavo', false, 2),
       ('Sono andata', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 152 (passato prossimo: agreement) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'With "essere" verbs in passato prossimo, the past participle must agree with what?',
         'With essere-auxiliary verbs, the past participle agrees with the SUBJECT in gender and number.',
         'The subject',
         'With essere, past participle agrees with the subject.',
         152
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Nothing — it never agrees', false, 0),
       ('The subject', true, 1),
       ('The direct object', false, 2),
       ('The auxiliary only', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 153 (aux: essere or avere mangiare) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which auxiliary does "mangiare" take in the passato prossimo?',
         'Transitive verbs like "mangiare" take "avere": "Ho mangiato".',
         'avere',
         '"Mangiare" takes "avere" in the passato prossimo.',
         153
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('avere', true, 0),
       ('essere', false, 1),
       ('stare', false, 2),
       ('fare', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 154 (aux: essere or avere andare) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which auxiliary does "andare" take in the passato prossimo?',
         'Most verbs of motion (andare, venire, partire, arrivare, etc.) take "essere".',
         'essere',
         '"Andare" takes "essere" in the passato prossimo.',
         154
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('avere', false, 0),
       ('stare', false, 1),
       ('essere', true, 2),
       ('fare', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 155 (aux: essere venire) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which auxiliary does "venire" take in the passato prossimo?',
         '"Venire" is a verb of motion → essere. Past participle is irregular: "venuto".',
         'essere',
         '"Venire" takes "essere" (sono venuto).',
         155
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('essere', true, 0),
       ('avere', false, 1),
       ('stare', false, 2),
       ('andare', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 156 (aux: essere nascere) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which auxiliary does "nascere" (to be born) take in the passato prossimo?',
         '"Nascere" takes "essere": "Sono nato/nata nel 1990".',
         'essere',
         '"Nascere" takes "essere" in the passato prossimo.',
         156
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('avere', false, 0),
       ('stare', false, 1),
       ('fare', false, 2),
       ('essere', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 157 (aux: avere leggere) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which auxiliary does "leggere" (to read) take in the passato prossimo?',
         '"Leggere" is transitive → "avere": "Ho letto un libro". Past participle "letto" is irregular.',
         'avere',
         '"Leggere" takes "avere" (ho letto).',
         157
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('essere', false, 0),
       ('avere', true, 1),
       ('stare', false, 2),
       ('fare', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 158 (participle: fatto) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the past participle of "fare"?',
         'The irregular past participle of "fare" is "fatto": "Ho fatto i compiti".',
         'fatto',
         'The past participle of "fare" is "fatto".',
         158
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('fato', false, 0),
       ('fatto', true, 1),
       ('faciuto', false, 2),
       ('feato', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 159 (participle: detto) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the past participle of "dire"?',
         'The irregular past participle of "dire" is "detto".',
         'detto',
         'The past participle of "dire" is "detto".',
         159
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('dito', false, 0),
       ('dicto', false, 1),
       ('dirito', false, 2),
       ('detto', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 160 (participle: visto) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the past participle of "vedere"?',
         '"Vedere" has the irregular past participle "visto" (also "veduto").',
         'visto',
         'The past participle of "vedere" is "visto".',
         160
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('vedeto', false, 0),
       ('visto', true, 1),
       ('vista', false, 2),
       ('vieto', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 161 (participle: scritto) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the past participle of "scrivere"?',
         'The past participle of "scrivere" is "scritto".',
         'scritto',
         'The past participle of "scrivere" is "scritto".',
         161
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('scriveto', false, 0),
       ('scrivuto', false, 1),
       ('scritto', true, 2),
       ('scriato', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 162 (participle: preso) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the past participle of "prendere"?',
         'The past participle of "prendere" is "preso".',
         'preso',
         'The past participle of "prendere" is "preso".',
         162
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('prenduto', false, 0),
       ('preso', true, 1),
       ('prendito', false, 2),
       ('presato', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 163 (participle: stato) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the past participle of "essere"?',
         'Both "essere" and "stare" share the same past participle: "stato".',
         'stato',
         '"Essere" and "stare" share the past participle "stato".',
         163
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('esto', false, 0),
       ('essuto', false, 1),
       ('essito', false, 2),
       ('stato', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 164 (imperfetto: -avo) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the "io" imperfetto of "parlare"?',
         'Imperfetto endings for -are: -avo, -avi, -ava, -avamo, -avate, -avano. "Io parlavo" = "I was speaking / I used to speak".',
         'parlavo',
         'The "io" imperfetto of "parlare" is "parlavo".',
         164
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('parlai', false, 0),
       ('parlavo', true, 1),
       ('ho parlato', false, 2),
       ('parlerò', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 165 (imperfetto: -evo) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the "io" imperfetto of "vendere"?',
         'Imperfetto endings for -ere: -evo, -evi, -eva, etc. "Vendevo" = "I was selling".',
         'vendevo',
         'The "io" imperfetto of "vendere" is "vendevo".',
         165
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('vendai', false, 0),
       ('vendevo', true, 1),
       ('vendavo', false, 2),
       ('vendivo', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 166 (imperfetto: -ivo) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the "io" imperfetto of "dormire"?',
         'Imperfetto endings for -ire: -ivo, -ivi, -iva, etc. "Dormivo" = "I was sleeping".',
         'dormivo',
         'The "io" imperfetto of "dormire" is "dormivo".',
         166
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('dormavo', false, 0),
       ('dormevo', false, 1),
       ('dormivo', true, 2),
       ('dormii', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 167 (imperfetto: essere ero) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the "io" imperfetto of "essere"?',
         '"Essere" imperfetto: ero, eri, era, eravamo, eravate, erano.',
         'ero',
         'The "io" imperfetto of "essere" is "ero".',
         167
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('ero', true, 0),
       ('era', false, 1),
       ('fui', false, 2),
       ('essevo', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 168 (imperfetto: avere avevo) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the "io" imperfetto of "avere"?',
         '"Avere" is regular in the imperfetto: avevo, avevi, aveva, etc.',
         'avevo',
         'The "io" imperfetto of "avere" is "avevo".',
         168
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('ebbi', false, 0),
       ('avevo', true, 1),
       ('avo', false, 2),
       ('avavo', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 169 (imperfetto: fare facevo) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the "io" imperfetto of "fare"?',
         '"Fare" uses its Latin stem "fac-" in imperfetto: facevo, facevi, faceva, etc.',
         'facevo',
         'The "io" imperfetto of "fare" is "facevo".',
         169
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('favevo', false, 0),
       ('faceva', false, 1),
       ('facevo', true, 2),
       ('facio', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 170 (imperfetto: dire dicevo) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the "io" imperfetto of "dire"?',
         '"Dire" uses Latin stem "dic-": dicevo, dicevi, diceva, etc.',
         'dicevo',
         'The "io" imperfetto of "dire" is "dicevo".',
         170
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('divevo', false, 0),
       ('dicevo', true, 1),
       ('diceva', false, 2),
       ('diressi', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 171 (imperfetto vs passato prossimo: habitual) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which tense expresses habitual actions in the past ("used to")?',
         'The imperfetto is used for ongoing, habitual, or descriptive past actions: "Da bambino giocavo a calcio".',
         'imperfetto',
         'Habitual past ("used to") uses the imperfetto.',
         171
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('passato prossimo', false, 0),
       ('imperfetto', true, 1),
       ('futuro semplice', false, 2),
       ('condizionale', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 172 (passato prossimo: completed) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which tense expresses a completed past action with a clear endpoint?',
         'The passato prossimo describes single, completed events: "Ieri ho mangiato la pizza".',
         'passato prossimo',
         'Completed single past events use the passato prossimo.',
         172
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('imperfetto', false, 0),
       ('condizionale', false, 1),
       ('passato prossimo', true, 2),
       ('trapassato', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 173 (imperfetto: description) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which tense is used to describe weather, time, age, and feelings in the past?',
         'Background descriptions (weather, time, age, mental states) use the imperfetto: "Faceva freddo e avevo paura".',
         'imperfetto',
         'Background description in the past uses the imperfetto.',
         173
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('passato prossimo', false, 0),
       ('imperfetto', true, 1),
       ('trapassato prossimo', false, 2),
       ('passato remoto', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 174 (translate: I was eating) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "I was eating" to Italian.',
         'Continuous past = imperfetto: "Mangiavo". (Or progressive: "Stavo mangiando".)',
         'Mangiavo',
         '"I was eating" is "Mangiavo".',
         174
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Ho mangiato', false, 0),
       ('Mangiavo', true, 1),
       ('Mangerò', false, 2),
       ('Mangiai', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 175 (translate: I ate yesterday) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "I ate pizza yesterday" to Italian.',
         'Completed event yesterday → passato prossimo: "Ieri ho mangiato la pizza".',
         'Ieri ho mangiato la pizza',
         '"I ate pizza yesterday" is "Ieri ho mangiato la pizza".',
         175
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Ieri mangiavo la pizza', false, 0),
       ('Ieri ho mangiato la pizza', true, 1),
       ('Ieri mangerò la pizza', false, 2),
       ('Ieri sono mangiato la pizza', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 176 (translate: I used to read) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "I used to read every day" to Italian.',
         'Habitual past = imperfetto: "Leggevo ogni giorno".',
         'Leggevo ogni giorno',
         '"I used to read every day" is "Leggevo ogni giorno".',
         176
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Ho letto ogni giorno', false, 0),
       ('Leggerò ogni giorno', false, 1),
       ('Leggevo ogni giorno', true, 2),
       ('Lessi ogni giorno', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 177 (translate: she went out) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "She went out" (passato prossimo) to Italian.',
         '"Uscire" is intransitive motion → essere. Feminine subject → agreement: "È uscita".',
         'È uscita',
         '"She went out" is "È uscita".',
         177
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Ha uscito', false, 0),
       ('È uscita', true, 1),
       ('È uscito', false, 2),
       ('Esce', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 178 (translate: they ate) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "They ate" (passato prossimo) to Italian.',
         '"Mangiare" takes "avere"; loro form: "Hanno mangiato". No participle agreement with avere unless preceded by direct-object pronoun.',
         'Hanno mangiato',
         '"They ate" is "Hanno mangiato".',
         178
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Sono mangiati', false, 0),
       ('Hanno mangiati', false, 1),
       ('Hanno mangiato', true, 2),
       ('Mangiavano', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 179 (passato prossimo io: piacere) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which auxiliary does "piacere" take in the passato prossimo?',
         '"Piacere" takes "essere", and the participle agrees with what is liked: "Mi è piaciuta la pizza".',
         'essere',
         '"Piacere" takes "essere" in the passato prossimo.',
         179
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('avere', false, 0),
       ('essere', true, 1),
       ('stare', false, 2),
       ('fare', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 180 (reflexive aux) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which auxiliary do all reflexive verbs take in the passato prossimo?',
         'All reflexive verbs use "essere": "Mi sono lavato", "Si è seduta".',
         'essere',
         'All reflexive verbs take "essere" in compound tenses.',
         180
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('essere', true, 0),
       ('avere', false, 1),
       ('Either, depending on transitivity', false, 2),
       ('stare', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 181 (translate: I have lived) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "I have lived in Rome" (m. speaker) to Italian.',
         '"Vivere" can take either avere or essere; with "essere" the participle agrees: "Sono vissuto a Roma" (or "Ho vissuto a Roma").',
         'Ho vissuto a Roma',
         '"I have lived in Rome" is commonly "Ho vissuto a Roma".',
         181
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Vivevo a Roma', false, 0),
       ('Ho vissuto a Roma', true, 1),
       ('Sono vissuta a Roma', false, 2),
       ('Vivrò a Roma', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 182 (translate: he was sleeping when) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "He was sleeping when I arrived." to Italian.',
         'Background action in progress = imperfetto; interrupting action = passato prossimo. "Dormiva quando sono arrivato/a".',
         'Dormiva quando sono arrivato',
         '"He was sleeping when I arrived" is "Dormiva quando sono arrivato".',
         182
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Ha dormito quando arrivavo.', false, 0),
       ('Dormiva quando sono arrivato.', true, 1),
       ('Dormirà quando sono arrivato.', false, 2),
       ('Dormiva quando arrivavo.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 183 (imperfetto: noi parlare) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the "noi" imperfetto of "parlare"?',
         '-are imperfetto, noi: -avamo. "Parlavamo" = "we were speaking / used to speak".',
         'parlavamo',
         'The "noi" imperfetto of "parlare" is "parlavamo".',
         183
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('parliamo', false, 0),
       ('parlammo', false, 1),
       ('parlavamo', true, 2),
       ('parleremo', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 184 (imperfetto: tu) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the "tu" imperfetto of "essere"?',
         '"Essere" imperfetto for tu is "eri".',
         'eri',
         'The "tu" imperfetto of "essere" is "eri".',
         184
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('era', false, 0),
       ('eri', true, 1),
       ('fui', false, 2),
       ('essevi', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 185 (passato prossimo: tu avere) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "Have you eaten?" (informal) in Italian?',
         'Passato prossimo, tu: "Hai mangiato?" Italian doesn''t need do-support.',
         'Hai mangiato?',
         '"Have you eaten?" is "Hai mangiato?".',
         185
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Mangi?', false, 0),
       ('Hai mangiato?', true, 1),
       ('Mangiavi?', false, 2),
       ('Sei mangiato?', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 186 (passato prossimo agreement w/ direct object) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In "Le ho mangiate" (referring to "le mele"), why is the participle "mangiate"?',
         'With "avere" the participle agrees with a preceding direct-object pronoun (lo, la, li, le).',
         'Agreement with preceding direct-object pronoun',
         'Participle agrees with preceding direct-object pronoun (lo/la/li/le).',
         186
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It''s a typo; should be "mangiato"', false, 0),
       ('It agrees with the subject', false, 1),
       ('It agrees with the preceding direct-object pronoun', true, 2),
       ('It agrees with the auxiliary', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 187 (passato prossimo: lui essere) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "He has been to Italy" to Italian.',
         '"Essere" itself uses "essere" as its own auxiliary: "È stato in Italia".',
         'È stato in Italia',
         '"He has been to Italy" is "È stato in Italia".',
         187
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Ha stato in Italia', false, 0),
       ('È stato in Italia', true, 1),
       ('Era in Italia', false, 2),
       ('Sarebbe stato in Italia', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 188 (translate: I drank) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "I drank" (passato prossimo) to Italian.',
         '"Bere" is transitive → avere. Past participle is "bevuto": "Ho bevuto".',
         'Ho bevuto',
         '"I drank" is "Ho bevuto".',
         188
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Ho beduto', false, 0),
       ('Sono bevuto', false, 1),
       ('Ho bevuto', true, 2),
       ('Bevvi', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 189 (translate: she opened) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "She opened the door" (passato prossimo) to Italian.',
         '"Aprire" is transitive → avere; past participle "aperto": "Ha aperto la porta".',
         'Ha aperto la porta',
         '"She opened the door" is "Ha aperto la porta".',
         189
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('È aperta la porta', false, 0),
       ('Ha aperto la porta', true, 1),
       ('Apriva la porta', false, 2),
       ('Aprì la porta', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 190 (translate: I came back) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "I came back" (passato prossimo, m. speaker) to Italian.',
         '"Tornare" is intransitive motion → essere: "Sono tornato".',
         'Sono tornato',
         '"I came back" (m.) is "Sono tornato".',
         190
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Ho tornato', false, 0),
       ('Tornai', false, 1),
       ('Sono tornato', true, 2),
       ('Tornavo', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 191 (translate: I had a dog) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "When I was a child, I had a dog" to Italian.',
         'Both verbs describe a continuous state → imperfetto: "Quando ero bambino, avevo un cane".',
         'Quando ero bambino, avevo un cane',
         'Both clauses are continuous states → imperfetto for both.',
         191
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Quando sono stato bambino, ho avuto un cane', false, 0),
       ('Quando ero bambino, avevo un cane', true, 1),
       ('Quando fui bambino, ebbi un cane', false, 2),
       ('Quando sarò bambino, avrò un cane', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 192 (passato remoto note) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In modern spoken Italian (especially northern Italy), which tense replaces the passato remoto in everyday speech?',
         'The passato remoto is largely literary; in everyday speech the passato prossimo is used even for distant past.',
         'passato prossimo',
         'Spoken Italian uses the passato prossimo where the passato remoto would historically appear.',
         192
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('imperfetto', false, 0),
       ('passato prossimo', true, 1),
       ('trapassato', false, 2),
       ('condizionale passato', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 193 (passato prossimo: we have spoken) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "We have spoken" (passato prossimo) to Italian.',
         '"Parlare" + avere: "Abbiamo parlato".',
         'Abbiamo parlato',
         '"We have spoken" is "Abbiamo parlato".',
         193
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Siamo parlati', false, 0),
       ('Parlavamo', false, 1),
       ('Abbiamo parlato', true, 2),
       ('Abbiamo parlati', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 194 (passato prossimo: stayed) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "She stayed home" (passato prossimo) to Italian.',
         '"Stare" takes essere, participle "stato/a": "È stata a casa".',
         'È stata a casa',
         '"She stayed home" is "È stata a casa".',
         194
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Ha stato a casa', false, 0),
       ('Stava a casa', false, 1),
       ('È stata a casa', true, 2),
       ('Stette a casa', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 195 (imperfetto: voi) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the "voi" imperfetto of "vivere"?',
         'Regular -ere imperfetto, voi: -evate. "Vivevate".',
         'vivevate',
         'The "voi" imperfetto of "vivere" is "vivevate".',
         195
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('vivete', false, 0),
       ('vivevate', true, 1),
       ('vivavate', false, 2),
       ('vivieste', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 196 (passato prossimo or imperfetto: weather) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Choose the best Italian for "It was raining all morning."',
         'Continuous weather over a stretch of time = imperfetto: "Pioveva tutta la mattina".',
         'Pioveva tutta la mattina',
         '"It was raining all morning" → "Pioveva tutta la mattina".',
         196
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Ha piovuto tutta la mattina', false, 0),
       ('Pioveva tutta la mattina', true, 1),
       ('Piove tutta la mattina', false, 2),
       ('Pioverà tutta la mattina', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 197 (participle: aperto) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the past participle of "aprire"?',
         'Past participle of "aprire" is the irregular "aperto".',
         'aperto',
         'The past participle of "aprire" is "aperto".',
         197
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('aprito', false, 0),
       ('aperto', true, 1),
       ('apruto', false, 2),
       ('apertuto', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 198 (participle: chiuso) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the past participle of "chiudere"?',
         'Past participle of "chiudere" is "chiuso".',
         'chiuso',
         'The past participle of "chiudere" is "chiuso".',
         198
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('chiudato', false, 0),
       ('chiuduto', false, 1),
       ('chiuso', true, 2),
       ('chiudo', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 199 (participle: morto) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the past participle of "morire"?',
         'Past participle of "morire" is "morto". "Morire" takes "essere": "È morto".',
         'morto',
         'The past participle of "morire" is "morto".',
         199
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('morito', false, 0),
       ('morto', true, 1),
       ('morirono', false, 2),
       ('moruto', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 200 (futuro: io parlare) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the "io" futuro semplice of "parlare"?',
         'Futuro endings: -ò, -ai, -à, -emo, -ete, -anno. -are verbs change "a" to "e": parl + erò = parlerò.',
         'parlerò',
         'The "io" futuro of "parlare" is "parlerò".',
         200
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('parlarò', false, 0),
       ('parlerò', true, 1),
       ('parlirò', false, 2),
       ('parli', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 201 (futuro: tu vendere) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the "tu" futuro semplice of "vendere"?',
         '-ere verbs lose the "e" before futuro endings: vend + erai = venderai.',
         'venderai',
         'The "tu" futuro of "vendere" is "venderai".',
         201
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('vendai', false, 0),
       ('vendirai', false, 1),
       ('venderai', true, 2),
       ('vendarai', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 202 (futuro: lei dormire) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the "lui/lei" futuro of "dormire"?',
         '-ire verbs: dorm + irà = dormirà.',
         'dormirà',
         'The "lui/lei" futuro of "dormire" is "dormirà".',
         202
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('dorma', false, 0),
       ('dormerà', false, 1),
       ('dormirà', true, 2),
       ('dormera', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 203 (futuro essere io) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the "io" futuro of "essere"?',
         '"Essere" futuro: sarò, sarai, sarà, saremo, sarete, saranno.',
         'sarò',
         'The "io" futuro of "essere" is "sarò".',
         203
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('essò', false, 0),
       ('serò', false, 1),
       ('sarò', true, 2),
       ('avrò', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 204 (futuro avere io) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the "io" futuro of "avere"?',
         '"Avere" drops "e": avrò, avrai, avrà, avremo, avrete, avranno.',
         'avrò',
         'The "io" futuro of "avere" is "avrò".',
         204
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('averò', false, 0),
       ('avrò', true, 1),
       ('arò', false, 2),
       ('ho', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 205 (futuro andare io) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the "io" futuro of "andare"?',
         '"Andare" drops "a": andrò, andrai, andrà, andremo, andrete, andranno.',
         'andrò',
         'The "io" futuro of "andare" is "andrò".',
         205
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('anderò', false, 0),
       ('andarò', false, 1),
       ('vado', false, 2),
       ('andrò', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 206 (futuro fare io) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the "io" futuro of "fare"?',
         '"Fare" futuro: farò, farai, farà, faremo, farete, faranno.',
         'farò',
         'The "io" futuro of "fare" is "farò".',
         206
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('faro', false, 0),
       ('faciò', false, 1),
       ('farò', true, 2),
       ('faserò', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 207 (futuro venire io) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the "io" futuro of "venire"?',
         '"Venire" has an irregular futuro stem "verr-": verrò, verrai, verrà, etc.',
         'verrò',
         'The "io" futuro of "venire" is "verrò".',
         207
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('venirò', false, 0),
       ('venerò', false, 1),
       ('vendrò', false, 2),
       ('verrò', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 208 (futuro volere io) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the "io" futuro of "volere"?',
         '"Volere" futuro stem "vorr-": vorrò, vorrai, vorrà, etc.',
         'vorrò',
         'The "io" futuro of "volere" is "vorrò".',
         208
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('volerò', false, 0),
       ('vorrò', true, 1),
       ('volò', false, 2),
       ('vorerò', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 209 (futuro potere io) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the "io" futuro of "potere"?',
         '"Potere" futuro stem "potr-": potrò, potrai, potrà, etc.',
         'potrò',
         'The "io" futuro of "potere" is "potrò".',
         209
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('poterò', false, 0),
       ('porò', false, 1),
       ('potrò', true, 2),
       ('possarò', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 210 (futuro dovere io) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the "io" futuro of "dovere"?',
         '"Dovere" futuro stem "dovr-": dovrò, dovrai, dovrà, etc.',
         'dovrò',
         'The "io" futuro of "dovere" is "dovrò".',
         210
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('doverò', false, 0),
       ('debbo', false, 1),
       ('dorrò', false, 2),
       ('dovrò', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 211 (futuro sapere io) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the "io" futuro of "sapere"?',
         '"Sapere" futuro stem "sapr-": saprò, saprai, saprà, etc.',
         'saprò',
         'The "io" futuro of "sapere" is "saprò".',
         211
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('saperò', false, 0),
       ('saprò', true, 1),
       ('sarò', false, 2),
       ('saperà', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 212 (translate: I will go) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "I will go to Italy" to Italian.',
         'Futuro of andare (io) is "andrò": "Andrò in Italia". Note "in Italia" — countries take "in".',
         'Andrò in Italia',
         '"I will go to Italy" is "Andrò in Italia".',
         212
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Vado a Italia', false, 0),
       ('Andrò in Italia', true, 1),
       ('Anderò a Italia', false, 2),
       ('Sarò Italia', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 213 (futuro: speculation usage) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Saranno le otto" mean?',
         'Italian uses the futuro to express speculation in the present: "It must be around eight".',
         'It must be about 8 o''clock',
         'Futuro can express speculation: "Saranno le otto" = "It must be about 8".',
         213
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('They will be eight', false, 0),
       ('It must be about 8 o''clock', true, 1),
       ('It''s 8 o''clock', false, 2),
       ('They are eight people', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 214 (condizionale: parlare io) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the "io" condizionale presente of "parlare"?',
         'Condizionale endings: -ei, -esti, -ebbe, -emmo, -este, -ebbero. -are → "e": parl + erei = parlerei.',
         'parlerei',
         'The "io" condizionale of "parlare" is "parlerei".',
         214
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('parlarei', false, 0),
       ('parlirei', false, 1),
       ('parlerei', true, 2),
       ('parlerebbe', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 215 (condizionale: lui parlare) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the "lui/lei" condizionale of "parlare"?',
         'Lui/lei condizionale: parl + erebbe = parlerebbe.',
         'parlerebbe',
         'The "lui/lei" condizionale of "parlare" is "parlerebbe".',
         215
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('parlerebbe', true, 0),
       ('parlerebe', false, 1),
       ('parlarebbe', false, 2),
       ('parlerebbero', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 216 (condizionale: vorrei) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Vorrei un caffè" mean?',
         '"Vorrei" is the condizionale "io" of "volere"; it''s the polite "I would like".',
         'I would like a coffee',
         '"Vorrei un caffè" means "I would like a coffee".',
         216
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('I want a coffee (rude)', false, 0),
       ('I wanted a coffee', false, 1),
       ('I would like a coffee', true, 2),
       ('I will have a coffee', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 217 (condizionale: sarei io) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the "io" condizionale of "essere"?',
         '"Essere" condizionale: sarei, saresti, sarebbe, saremmo, sareste, sarebbero.',
         'sarei',
         'The "io" condizionale of "essere" is "sarei".',
         217
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('sarei', true, 0),
       ('sarò', false, 1),
       ('essei', false, 2),
       ('serei', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 218 (condizionale: avrei io) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the "io" condizionale of "avere"?',
         '"Avere" condizionale: avrei, avresti, avrebbe, avremmo, avreste, avrebbero.',
         'avrei',
         'The "io" condizionale of "avere" is "avrei".',
         218
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('averei', false, 0),
       ('arei', false, 1),
       ('avrei', true, 2),
       ('havrei', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 219 (condizionale: andrei) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the "io" condizionale of "andare"?',
         '"Andare" condizionale: andrei, andresti, andrebbe, andremmo, andreste, andrebbero.',
         'andrei',
         'The "io" condizionale of "andare" is "andrei".',
         219
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('anderei', false, 0),
       ('andrei', true, 1),
       ('andrò', false, 2),
       ('andarei', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 220 (condizionale: politeness) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why is the condizionale often used for polite requests in Italian?',
         'The conditional softens requests, making them less direct and more polite (like English "would" or "could").',
         'To soften requests / be polite',
         'The condizionale is used to make requests more polite.',
         220
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It''s grammatically required', false, 0),
       ('To soften requests and be polite', true, 1),
       ('It refers to the past', false, 2),
       ('Only verbs of motion need it', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 221 (translate: I would eat) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "I would eat pizza" to Italian.',
         'Condizionale of "mangiare": "Mangerei la pizza".',
         'Mangerei la pizza',
         '"I would eat pizza" is "Mangerei la pizza".',
         221
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Mangiavo la pizza', false, 0),
       ('Mangerò la pizza', false, 1),
       ('Mangerei la pizza', true, 2),
       ('Mangiassi la pizza', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 222 (condizionale passato: avrei mangiato) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you form the condizionale passato of "mangiare" for "io"?',
         'Condizionale passato = condizionale of auxiliary + past participle: "Avrei mangiato".',
         'Avrei mangiato',
         'Condizionale passato (io, mangiare) = "Avrei mangiato".',
         222
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Mangerei', false, 0),
       ('Avrei mangiato', true, 1),
       ('Ho mangiato', false, 2),
       ('Sarei mangiato', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 223 (condizionale passato: usage) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Avrei mangiato" mean in English?',
         'Condizionale passato translates as "would have + past participle": "I would have eaten".',
         'I would have eaten',
         '"Avrei mangiato" = "I would have eaten".',
         223
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('I would eat', false, 0),
       ('I had eaten', false, 1),
       ('I will have eaten', false, 2),
       ('I would have eaten', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 224 (trapassato: form) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How is the trapassato prossimo formed?',
         'Trapassato prossimo = imperfetto of essere/avere + past participle: "Avevo mangiato" / "Ero andato".',
         'imperfetto of essere/avere + past participle',
         'Trapassato prossimo = imperfetto of auxiliary + past participle.',
         224
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('present of avere + participle', false, 0),
       ('imperfetto of essere/avere + past participle', true, 1),
       ('futuro of essere + participle', false, 2),
       ('condizionale of essere + participle', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 225 (trapassato: avevo mangiato) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Avevo mangiato" mean?',
         'Trapassato prossimo expresses a past action prior to another past action: "I had eaten".',
         'I had eaten',
         '"Avevo mangiato" = "I had eaten".',
         225
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('I would eat', false, 0),
       ('I had eaten', true, 1),
       ('I was eating', false, 2),
       ('I have eaten', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 226 (trapassato: ero andato) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Ero andato" mean?',
         'Trapassato of "andare" (m.): "I had gone". Participle agrees with subject because essere is the aux.',
         'I had gone',
         '"Ero andato" = "I had gone".',
         226
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('I was going', false, 0),
       ('I will go', false, 1),
       ('I had gone', true, 2),
       ('I went', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 227 (translate: when he arrived I had left) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "When he arrived, I had already left." (m.) to Italian.',
         '"Arrived" = passato prossimo; "had already left" = trapassato prossimo: "Quando è arrivato, ero già partito".',
         'Quando è arrivato, ero già partito',
         'Earlier-past action takes trapassato prossimo.',
         227
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Quando arrivò, partivo già', false, 0),
       ('Quando è arrivato, ero già partito', true, 1),
       ('Quando arriverà, sono partito', false, 2),
       ('Quando arrivava, ho partito', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 228 (futuro anteriore: form) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How is the futuro anteriore formed?',
         'Futuro anteriore = futuro of essere/avere + past participle: "Avrò mangiato" / "Sarò andato".',
         'futuro of essere/avere + past participle',
         'Futuro anteriore = futuro of auxiliary + past participle.',
         228
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('present of essere + participle', false, 0),
       ('imperfetto of avere + infinitive', false, 1),
       ('futuro of essere/avere + past participle', true, 2),
       ('condizionale + futuro', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 229 (translate: I would like to go) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "I would like to go to the beach" in Italian?',
         '"Vorrei andare al mare" uses condizionale "vorrei" + infinitive.',
         'Vorrei andare al mare',
         '"I''d like to go to the beach" is "Vorrei andare al mare".',
         229
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Voglio andare al mare', false, 0),
       ('Vorrei andato al mare', false, 1),
       ('Vorrei andare al mare', true, 2),
       ('Andrei volere al mare', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 230 (translate: you should go) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "You should go to the doctor" (informal) to Italian.',
         '"Dovresti" is the tu condizionale of "dovere" — used for advice: "you should".',
         'Dovresti andare dal dottore',
         '"You should go to the doctor" → "Dovresti andare dal dottore".',
         230
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Devi andare dal dottore', false, 0),
       ('Dovrai andare dal dottore', false, 1),
       ('Dovresti andare dal dottore', true, 2),
       ('Vai dal dottore', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 231 (futuro: future expression) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "Tomorrow I will study" to Italian.',
         'Future of "studiare" for io: "Domani studierò".',
         'Domani studierò',
         '"Tomorrow I will study" is "Domani studierò".',
         231
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Domani studio', false, 0),
       ('Domani ho studiato', false, 1),
       ('Domani studiavo', false, 2),
       ('Domani studierò', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 232 (condizionale: noi parlare) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the "noi" condizionale of "parlare"?',
         'Noi condizionale of -are: -emmo. parl + eremmo = parleremmo (double m).',
         'parleremmo',
         'The "noi" condizionale of "parlare" is "parleremmo".',
         232
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('parleremmo', true, 0),
       ('parleremo', false, 1),
       ('parlemmo', false, 2),
       ('parlaremmo', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 233 (condizionale vs futuro distinction) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which form is futuro vs condizionale: "parlerò" vs "parlerei"?',
         '"Parlerò" = futuro ("I will speak"); "parlerei" = condizionale ("I would speak").',
         'parlerò = future; parlerei = conditional',
         '"Parlerò" is future; "parlerei" is conditional.',
         233
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Both are futuro', false, 0),
       ('Parlerò = future; parlerei = conditional', true, 1),
       ('Parlerò = conditional; parlerei = future', false, 2),
       ('Both are conditional', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 234 (futuro: noi vivere) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the "noi" futuro of "vivere"?',
         '"Vivere" futuro: vivrò, vivrai, vivrà, vivremo, vivrete, vivranno (stem "vivr-").',
         'vivremo',
         'The "noi" futuro of "vivere" is "vivremo".',
         234
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('viviamo', false, 0),
       ('viveremo', false, 1),
       ('vivremo', true, 2),
       ('vivremmo', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 235 (futuro: loro venire) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the "loro" futuro of "venire"?',
         '"Venire" futuro loro: "verranno".',
         'verranno',
         'The "loro" futuro of "venire" is "verranno".',
         235
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('verranno', true, 0),
       ('veniranno', false, 1),
       ('verrebbero', false, 2),
       ('verranno', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 236 (trapassato: noi avevamo) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Avevamo parlato" mean?',
         '"Avevamo" is imperfetto of "avere" for noi → trapassato prossimo: "We had spoken".',
         'We had spoken',
         '"Avevamo parlato" = "We had spoken".',
         236
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('We were speaking', false, 0),
       ('We spoke', false, 1),
       ('We will speak', false, 2),
       ('We had spoken', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 237 (futuro: subordinate clause "se") -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In "Se ___ tempo, andrò al cinema" (If I have time, I''ll go to the movies), what verb form is best?',
         'In real-condition "se" clauses about the future, Italian uses indicative present or future: "Se ho tempo".',
         'ho (indicative present)',
         'Real-condition "se" + indicative present: "Se ho tempo, andrò...".',
         237
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('avessi', false, 0),
       ('avrei', false, 1),
       ('ho', true, 2),
       ('abbia', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 238 (trapassato: lui era partito) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Era partito" mean?',
         'Trapassato prossimo of "partire" (m. sing.): "He had left".',
         'He had left',
         '"Era partito" = "He had left".',
         238
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('He left', false, 0),
       ('He was leaving', false, 1),
       ('He had left', true, 2),
       ('He has left', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 239 (condizionale passato: future-in-the-past) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "He said he would come" in Italian?',
         'Italian uses the condizionale passato (NOT condizionale presente) for "future in the past": "Ha detto che sarebbe venuto".',
         'Ha detto che sarebbe venuto',
         '"Future in the past" uses condizionale passato: "sarebbe venuto".',
         239
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Ha detto che verrebbe', false, 0),
       ('Ha detto che sarebbe venuto', true, 1),
       ('Ha detto che verrà', false, 2),
       ('Ha detto che era venuto', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 240 (condizionale: voi parlare) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the "voi" condizionale of "parlare"?',
         'Voi condizionale -are: parl + ereste = parlereste.',
         'parlereste',
         'The "voi" condizionale of "parlare" is "parlereste".',
         240
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('parleresti', false, 0),
       ('parlate', false, 1),
       ('parlereste', true, 2),
       ('parlaste', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 241 (condizionale: loro parlare) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the "loro" condizionale of "parlare"?',
         'Loro condizionale -are: parl + erebbero = parlerebbero.',
         'parlerebbero',
         'The "loro" condizionale of "parlare" is "parlerebbero".',
         241
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('parlerebbero', true, 0),
       ('parlebbero', false, 1),
       ('parlerebero', false, 2),
       ('parlarebbero', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 242 (futuro: voi parlare) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the "voi" futuro of "parlare"?',
         'Voi futuro -are: parl + erete = parlerete.',
         'parlerete',
         'The "voi" futuro of "parlare" is "parlerete".',
         242
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('parlate', false, 0),
       ('parlerete', true, 1),
       ('parlereste', false, 2),
       ('parlaste', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 243 (futuro: loro parlare) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the "loro" futuro of "parlare"?',
         'Loro futuro -are: parl + eranno = parleranno.',
         'parleranno',
         'The "loro" futuro of "parlare" is "parleranno".',
         243
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('parleranno', true, 0),
       ('parlerano', false, 1),
       ('parlanno', false, 2),
       ('parlarono', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 244 (futuro anteriore: meaning) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Avrò finito" mean?',
         'Futuro anteriore: "I will have finished".',
         'I will have finished',
         '"Avrò finito" = "I will have finished".',
         244
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('I finished', false, 0),
       ('I would have finished', false, 1),
       ('I will have finished', true, 2),
       ('I had finished', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 245 (condizionale: usage gossip) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the condizionale express in "Secondo il giornale, sarebbero in vacanza"?',
         'The condizionale is used for unconfirmed/reported information ("would be / supposedly are").',
         'Reported/unconfirmed information',
         'Conditional can mark reported/unconfirmed information ("supposedly").',
         245
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A definite future event', false, 0),
       ('Reported / unconfirmed information', true, 1),
       ('A polite request', false, 2),
       ('A habitual past action', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 246 (translate: would you help me) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "Could you help me?" (formal) to Italian.',
         'Polite request → condizionale of "potere" + Lei: "Potrebbe aiutarmi?".',
         'Potrebbe aiutarmi?',
         '"Could you help me?" (formal) is "Potrebbe aiutarmi?".',
         246
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Può aiutarmi?', false, 0),
       ('Potrebbe aiutarmi?', true, 1),
       ('Potresti aiutarmi?', false, 2),
       ('Potrai aiutarmi?', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 247 (trapassato remoto note) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How is the trapassato prossimo of "andare" formed for "io" (m.)?',
         'Imperfetto of "essere" + agreement participle: "Ero andato".',
         'Ero andato',
         'Trapassato prossimo of "andare" (io, m.) is "Ero andato".',
         247
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Avevo andato', false, 0),
       ('Sono andato', false, 1),
       ('Ero andato', true, 2),
       ('Andavo', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 248 (condizionale passato avere/essere) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "I would have gone" (m.) to Italian.',
         'Condizionale passato of "andare" → condizionale of "essere" + participle: "Sarei andato".',
         'Sarei andato',
         '"I would have gone" (m.) is "Sarei andato".',
         248
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Andrei', false, 0),
       ('Avrei andato', false, 1),
       ('Sarei andato', true, 2),
       ('Ero andato', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 249 (futuro: usage probability) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "He must be home" (probability) to Italian.',
         'Italian uses futuro to express probability/conjecture in the present: "Sarà a casa".',
         'Sarà a casa',
         '"He must be home" (probability) = "Sarà a casa".',
         249
  from modules where slug = 'italian'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('È a casa', false, 0),
       ('Sarà a casa', true, 1),
       ('Sarebbe a casa', false, 2),
       ('Era a casa', false, 3)
     ) as c(label, is_correct, order_index);

-- BATCH_2_PLACEHOLDER
