-- 019_seed_japanese.sql
-- Japanese module: 250 quiz questions (batch 1 of 2)

-- Question 0 (greeting: ohayou) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "Good morning" in Japanese?',
         '"Ohayou gozaimasu" is the polite morning greeting; "ohayou" alone is casual.',
         'おはようございます (Ohayou gozaimasu)',
         '"Good morning" in Japanese is "Ohayou gozaimasu" (polite).',
         0
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Konnichiwa', false, 0),
       ('Ohayou gozaimasu', true, 1),
       ('Konbanwa', false, 2),
       ('Oyasumi', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 1 (greeting: konnichiwa) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Konnichiwa" mean?',
         '"Konnichiwa" is the standard daytime greeting, typically used from late morning to early evening.',
         'こんにちは — Hello / Good afternoon',
         '"Konnichiwa" means "hello" or "good afternoon".',
         1
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Good night', false, 0),
       ('Goodbye', false, 1),
       ('Hello / Good afternoon', true, 2),
       ('Excuse me', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 2 (greeting: konbanwa) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "Good evening" in Japanese?',
         '"Konbanwa" is the evening greeting, used after sunset.',
         'こんばんは (Konbanwa)',
         '"Good evening" in Japanese is "Konbanwa".',
         2
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Konnichiwa', false, 0),
       ('Konbanwa', true, 1),
       ('Ohayou', false, 2),
       ('Oyasumi', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 3 (greeting: oyasumi) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Oyasumi nasai" mean?',
         '"Oyasumi nasai" is said before going to bed; "oyasumi" alone is the casual form.',
         'おやすみなさい — Good night',
         '"Oyasumi nasai" means "good night" (said before bed).',
         3
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Good morning', false, 0),
       ('Good evening', false, 1),
       ('Good night', true, 2),
       ('See you later', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 4 (greeting: sayounara) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "Goodbye" in Japanese (formal/long-term)?',
         '"Sayounara" carries a sense of long parting; for short goodbyes Japanese speakers often prefer "ja ne" or "mata ne".',
         'さようなら (Sayounara)',
         '"Sayounara" means "goodbye" — used for long or indefinite partings.',
         4
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Sayounara', true, 0),
       ('Hajimemashite', false, 1),
       ('Otsukaresama', false, 2),
       ('Ohayou', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 5 (greeting: hajimemashite) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'When is "Hajimemashite" used?',
         '"Hajimemashite" literally means "for the first time" and is said when meeting someone for the first time.',
         'はじめまして — Nice to meet you',
         '"Hajimemashite" is said when meeting someone for the first time.',
         5
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('When apologizing', false, 0),
       ('When meeting someone for the first time', true, 1),
       ('When saying goodbye', false, 2),
       ('When entering a room', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 6 (greeting: ja mata) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Ja, mata" mean?',
         '"Ja, mata" literally is "well, again", used as a casual "see you later".',
         'じゃ、また — See you later (casual)',
         '"Ja, mata" means "see you later" (casual).',
         6
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Nice to meet you', false, 0),
       ('See you later', true, 1),
       ('Long time no see', false, 2),
       ('Welcome back', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 7 (greeting: mata ashita) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "See you tomorrow" to Japanese.',
         '"Mata ashita" combines "mata" (again) + "ashita" (tomorrow).',
         'また明日 (Mata ashita)',
         '"See you tomorrow" in Japanese is "Mata ashita".',
         7
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Mata ashita', true, 0),
       ('Mata raishuu', false, 1),
       ('Ja matane', false, 2),
       ('Otsukaresama', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 8 (greeting: ohisashiburi) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Ohisashiburi desu" mean?',
         '"Ohisashiburi desu" is said when meeting someone after a long time apart.',
         'お久しぶりです — Long time no see',
         '"Ohisashiburi desu" means "long time no see".',
         8
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Welcome home', false, 0),
       ('Nice to meet you', false, 1),
       ('Long time no see', true, 2),
       ('See you again', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 9 (greeting: otsukaresama) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'When is "Otsukaresama desu" typically said?',
         '"Otsukaresama desu" acknowledges someone''s effort or tiredness — often said at the end of work or after a task.',
         'お疲れ様です — Thanks for your hard work',
         '"Otsukaresama desu" is said to acknowledge effort, often after work.',
         9
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Before eating', false, 0),
       ('To acknowledge someone''s hard work', true, 1),
       ('When meeting for the first time', false, 2),
       ('When apologizing', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 10 (courtesy: arigatou) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "Thank you" politely in Japanese?',
         '"Arigatou gozaimasu" is the polite form; "arigatou" alone is casual.',
         'ありがとうございます (Arigatou gozaimasu)',
         '"Thank you" (polite) in Japanese is "Arigatou gozaimasu".',
         10
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Sumimasen', false, 0),
       ('Arigatou gozaimasu', true, 1),
       ('Douitashimashite', false, 2),
       ('Onegaishimasu', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 11 (courtesy: sumimasen) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Sumimasen" mean?',
         '"Sumimasen" is multipurpose: "excuse me", "I''m sorry", and sometimes "thank you" for an inconvenience.',
         'すみません — Excuse me / Sorry',
         '"Sumimasen" means "excuse me" or "sorry".',
         11
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Thank you', false, 0),
       ('Excuse me / Sorry', true, 1),
       ('You''re welcome', false, 2),
       ('Please', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 12 (courtesy: gomennasai) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "I''m sorry" sincerely in Japanese?',
         '"Gomennasai" is a more heartfelt apology than "sumimasen"; "gomen" alone is casual.',
         'ごめんなさい (Gomennasai)',
         '"I''m sorry" (sincere) in Japanese is "Gomennasai".',
         12
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Gomennasai', true, 0),
       ('Douzo', false, 1),
       ('Onegaishimasu', false, 2),
       ('Otsukaresama', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 13 (courtesy: douzo) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Douzo" mean?',
         '"Douzo" is used when offering something — "please go ahead", "here you are", "please take it".',
         'どうぞ — Please / Here you go',
         '"Douzo" means "please" / "here you go" when offering something.',
         13
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Thank you', false, 0),
       ('I''m sorry', false, 1),
       ('Please / Here you go', true, 2),
       ('Excuse me', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 14 (courtesy: douitashimashite) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the typical reply to "Arigatou gozaimasu"?',
         '"Douitashimashite" is the polite "you''re welcome", though "iie" or "tondemonai" are also common.',
         'どういたしまして — You''re welcome',
         '"Douitashimashite" means "you''re welcome".',
         14
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Sumimasen', false, 0),
       ('Onegaishimasu', false, 1),
       ('Douitashimashite', true, 2),
       ('Hajimemashite', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 15 (courtesy: onegaishimasu) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Onegaishimasu" mean?',
         '"Onegaishimasu" is a polite "please" used when requesting something, or as "I look forward to working with you".',
         'お願いします — Please (request)',
         '"Onegaishimasu" means "please" when making a request.',
         15
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Please (request)', true, 0),
       ('Thank you', false, 1),
       ('Goodbye', false, 2),
       ('Welcome', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 16 (courtesy: itadakimasu) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is said before eating a meal in Japan?',
         '"Itadakimasu" expresses gratitude before eating — literally "I humbly receive".',
         'いただきます (Itadakimasu)',
         '"Itadakimasu" is said before eating.',
         16
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Gochisousama', false, 0),
       ('Itadakimasu', true, 1),
       ('Otsukaresama', false, 2),
       ('Oyasumi', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 17 (courtesy: gochisousama) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is said after finishing a meal in Japan?',
         '"Gochisousama deshita" expresses thanks for the meal — literally "it was a feast".',
         'ごちそうさまでした (Gochisousama deshita)',
         '"Gochisousama deshita" is said after eating.',
         17
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Itadakimasu', false, 0),
       ('Oyasumi', false, 1),
       ('Gochisousama deshita', true, 2),
       ('Onegaishimasu', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 18 (courtesy: tadaima/okaeri) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Tadaima" mean?',
         '"Tadaima" is said by someone arriving home; the household replies "Okaerinasai".',
         'ただいま — I''m home',
         '"Tadaima" means "I''m home" — said when returning home.',
         18
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Welcome back', false, 0),
       ('I''m home', true, 1),
       ('See you later', false, 2),
       ('Good night', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 19 (courtesy: okaeri) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is said to welcome someone home in Japanese?',
         '"Okaerinasai" (or casual "okaeri") is the reply to "Tadaima".',
         'おかえりなさい (Okaerinasai)',
         '"Okaerinasai" means "welcome home".',
         19
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Tadaima', false, 0),
       ('Okaerinasai', true, 1),
       ('Konnichiwa', false, 2),
       ('Otsukaresama', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 20 (hiragana: あ) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What sound does the hiragana あ make?',
         'あ is the first hiragana in the gojuuon order and represents the vowel "a".',
         'あ → a',
         'The hiragana あ is romanized as "a".',
         20
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('i', false, 0),
       ('a', true, 1),
       ('u', false, 2),
       ('o', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 21 (hiragana: い) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What sound does the hiragana い make?',
         'い is the second vowel hiragana, romanized as "i" (pronounced like "ee").',
         'い → i',
         'The hiragana い is romanized as "i".',
         21
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('a', false, 0),
       ('e', false, 1),
       ('i', true, 2),
       ('o', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 22 (hiragana: う) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What sound does the hiragana う make?',
         'う is the third vowel hiragana, romanized as "u" (a flat, unrounded "oo").',
         'う → u',
         'The hiragana う is romanized as "u".',
         22
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('o', false, 0),
       ('u', true, 1),
       ('i', false, 2),
       ('a', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 23 (hiragana: え) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What sound does the hiragana え make?',
         'え is romanized as "e" (pronounced like "eh").',
         'え → e',
         'The hiragana え is romanized as "e".',
         23
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('a', false, 0),
       ('e', true, 1),
       ('i', false, 2),
       ('u', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 24 (hiragana: お) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What sound does the hiragana お make?',
         'お is the fifth vowel hiragana, romanized as "o".',
         'お → o',
         'The hiragana お is romanized as "o".',
         24
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('u', false, 0),
       ('i', false, 1),
       ('e', false, 2),
       ('o', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 25 (hiragana: か) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What sound does the hiragana か make?',
         'か is the first of the k-row, romanized as "ka".',
         'か → ka',
         'The hiragana か is romanized as "ka".',
         25
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('ka', true, 0),
       ('ki', false, 1),
       ('ku', false, 2),
       ('ko', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 26 (hiragana: き) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What sound does the hiragana き make?',
         'き is the second k-row hiragana, romanized as "ki".',
         'き → ki',
         'The hiragana き is romanized as "ki".',
         26
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('ka', false, 0),
       ('ki', true, 1),
       ('ke', false, 2),
       ('ku', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 27 (hiragana: く) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What sound does the hiragana く make?',
         'く is the third k-row hiragana, romanized as "ku".',
         'く → ku',
         'The hiragana く is romanized as "ku".',
         27
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('ko', false, 0),
       ('ke', false, 1),
       ('ku', true, 2),
       ('ki', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 28 (hiragana: け) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What sound does the hiragana け make?',
         'け is the fourth k-row hiragana, romanized as "ke".',
         'け → ke',
         'The hiragana け is romanized as "ke".',
         28
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('ke', true, 0),
       ('ka', false, 1),
       ('ko', false, 2),
       ('ku', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 29 (hiragana: こ) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What sound does the hiragana こ make?',
         'こ is the fifth k-row hiragana, romanized as "ko".',
         'こ → ko',
         'The hiragana こ is romanized as "ko".',
         29
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('ko', true, 0),
       ('ki', false, 1),
       ('ke', false, 2),
       ('ka', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 30 (hiragana: さ) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What sound does the hiragana さ make?',
         'さ is the first s-row hiragana, romanized as "sa".',
         'さ → sa',
         'The hiragana さ is romanized as "sa".',
         30
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('sa', true, 0),
       ('shi', false, 1),
       ('su', false, 2),
       ('so', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 31 (hiragana: し) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What sound does the hiragana し make?',
         'し is irregular: although in the s-row, it is romanized "shi" (not "si").',
         'し → shi',
         'The hiragana し is romanized as "shi".',
         31
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('si', false, 0),
       ('shi', true, 1),
       ('chi', false, 2),
       ('sa', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 32 (hiragana: す) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What sound does the hiragana す make?',
         'す is the third s-row hiragana, romanized as "su".',
         'す → su',
         'The hiragana す is romanized as "su".',
         32
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('shi', false, 0),
       ('so', false, 1),
       ('su', true, 2),
       ('sa', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 33 (hiragana: た) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What sound does the hiragana た make?',
         'た is the first t-row hiragana, romanized as "ta".',
         'た → ta',
         'The hiragana た is romanized as "ta".',
         33
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('ta', true, 0),
       ('chi', false, 1),
       ('tsu', false, 2),
       ('te', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 34 (hiragana: ち) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What sound does the hiragana ち make?',
         'ち is irregular: in the t-row but romanized "chi" (not "ti").',
         'ち → chi',
         'The hiragana ち is romanized as "chi".',
         34
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('ti', false, 0),
       ('chi', true, 1),
       ('shi', false, 2),
       ('tsu', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 35 (hiragana: つ) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What sound does the hiragana つ make?',
         'つ is irregular: in the t-row but romanized "tsu" (not "tu").',
         'つ → tsu',
         'The hiragana つ is romanized as "tsu".',
         35
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('tu', false, 0),
       ('chi', false, 1),
       ('tsu', true, 2),
       ('su', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 36 (hiragana: な) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What sound does the hiragana な make?',
         'な is the first n-row hiragana, romanized as "na".',
         'な → na',
         'The hiragana な is romanized as "na".',
         36
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('na', true, 0),
       ('ni', false, 1),
       ('nu', false, 2),
       ('no', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 37 (hiragana: に) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What sound does the hiragana に make?',
         'に is the second n-row hiragana, romanized as "ni".',
         'に → ni',
         'The hiragana に is romanized as "ni".',
         37
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('na', false, 0),
       ('ni', true, 1),
       ('no', false, 2),
       ('ne', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 38 (hiragana: は) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What sound does the hiragana は make as a syllable (not particle)?',
         'は is "ha" as a syllable; as the topic particle it is read "wa".',
         'は → ha (or "wa" as particle)',
         'The hiragana は is romanized "ha" — but read "wa" when used as the topic particle.',
         38
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('ha', true, 0),
       ('hi', false, 1),
       ('he', false, 2),
       ('fu', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 39 (hiragana: ひ) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What sound does the hiragana ひ make?',
         'ひ is the second h-row hiragana, romanized as "hi".',
         'ひ → hi',
         'The hiragana ひ is romanized as "hi".',
         39
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('ha', false, 0),
       ('hi', true, 1),
       ('fu', false, 2),
       ('he', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 40 (katakana: ア) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What sound does the katakana ア make?',
         'Katakana ア is the equivalent of hiragana あ, romanized "a". Katakana is used mainly for foreign loanwords.',
         'ア → a',
         'The katakana ア is romanized as "a".',
         40
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('i', false, 0),
       ('a', true, 1),
       ('o', false, 2),
       ('u', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 41 (katakana: イ) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What sound does the katakana イ make?',
         'Katakana イ corresponds to hiragana い, romanized "i".',
         'イ → i',
         'The katakana イ is romanized as "i".',
         41
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('a', false, 0),
       ('i', true, 1),
       ('e', false, 2),
       ('u', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 42 (katakana: ウ) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What sound does the katakana ウ make?',
         'Katakana ウ corresponds to hiragana う, romanized "u".',
         'ウ → u',
         'The katakana ウ is romanized as "u".',
         42
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('o', false, 0),
       ('e', false, 1),
       ('u', true, 2),
       ('i', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 43 (katakana: エ) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What sound does the katakana エ make?',
         'Katakana エ corresponds to hiragana え, romanized "e".',
         'エ → e',
         'The katakana エ is romanized as "e".',
         43
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('a', false, 0),
       ('e', true, 1),
       ('o', false, 2),
       ('u', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 44 (katakana: オ) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What sound does the katakana オ make?',
         'Katakana オ corresponds to hiragana お, romanized "o".',
         'オ → o',
         'The katakana オ is romanized as "o".',
         44
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('u', false, 0),
       ('i', false, 1),
       ('e', false, 2),
       ('o', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 45 (katakana: カ) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What sound does the katakana カ make?',
         'Katakana カ corresponds to hiragana か, romanized "ka".',
         'カ → ka',
         'The katakana カ is romanized as "ka".',
         45
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('ka', true, 0),
       ('ki', false, 1),
       ('ku', false, 2),
       ('ko', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 46 (katakana: キ) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What sound does the katakana キ make?',
         'Katakana キ corresponds to hiragana き, romanized "ki".',
         'キ → ki',
         'The katakana キ is romanized as "ki".',
         46
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('ka', false, 0),
       ('ki', true, 1),
       ('ke', false, 2),
       ('ku', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 47 (katakana: コ) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What sound does the katakana コ make?',
         'Katakana コ corresponds to hiragana こ, romanized "ko".',
         'コ → ko',
         'The katakana コ is romanized as "ko".',
         47
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('ku', false, 0),
       ('ki', false, 1),
       ('ka', false, 2),
       ('ko', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 48 (katakana: サ) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What sound does the katakana サ make?',
         'Katakana サ corresponds to hiragana さ, romanized "sa".',
         'サ → sa',
         'The katakana サ is romanized as "sa".',
         48
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('sa', true, 0),
       ('shi', false, 1),
       ('su', false, 2),
       ('so', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 49 (katakana: シ) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What sound does the katakana シ make?',
         'Katakana シ corresponds to hiragana し, romanized "shi". Often confused visually with ツ (tsu).',
         'シ → shi',
         'The katakana シ is romanized as "shi".',
         49
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('tsu', false, 0),
       ('so', false, 1),
       ('shi', true, 2),
       ('sa', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 50 (katakana: タ) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What sound does the katakana タ make?',
         'Katakana タ corresponds to hiragana た, romanized "ta".',
         'タ → ta',
         'The katakana タ is romanized as "ta".',
         50
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('ta', true, 0),
       ('chi', false, 1),
       ('tsu', false, 2),
       ('te', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 51 (katakana: ツ) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What sound does the katakana ツ make?',
         'Katakana ツ corresponds to hiragana つ, romanized "tsu". Visually similar to シ (shi).',
         'ツ → tsu',
         'The katakana ツ is romanized as "tsu".',
         51
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('shi', false, 0),
       ('tsu', true, 1),
       ('chi', false, 2),
       ('su', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 52 (katakana: ナ) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What sound does the katakana ナ make?',
         'Katakana ナ corresponds to hiragana な, romanized "na".',
         'ナ → na',
         'The katakana ナ is romanized as "na".',
         52
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('na', true, 0),
       ('nu', false, 1),
       ('ne', false, 2),
       ('no', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 53 (katakana: ハ) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What sound does the katakana ハ make?',
         'Katakana ハ corresponds to hiragana は, romanized "ha".',
         'ハ → ha',
         'The katakana ハ is romanized as "ha".',
         53
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('ha', true, 0),
       ('hi', false, 1),
       ('he', false, 2),
       ('fu', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 54 (katakana: マ) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What sound does the katakana マ make?',
         'Katakana マ corresponds to hiragana ま, romanized "ma".',
         'マ → ma',
         'The katakana マ is romanized as "ma".',
         54
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('ma', true, 0),
       ('mi', false, 1),
       ('mu', false, 2),
       ('mo', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 55 (kanji: 人) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the kanji 人 mean?',
         '人 means "person". Common readings: ひと (hito), にん (nin), じん (jin).',
         '人 → person (hito / nin / jin)',
         'The kanji 人 means "person".',
         55
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Tree', false, 0),
       ('Person', true, 1),
       ('Mountain', false, 2),
       ('River', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 56 (kanji: 日) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the kanji 日 mean?',
         '日 means "sun" or "day". Readings include ひ (hi), にち (nichi), び (bi).',
         '日 → sun / day (hi / nichi)',
         'The kanji 日 means "sun" or "day".',
         56
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Moon', false, 0),
       ('Star', false, 1),
       ('Sun / Day', true, 2),
       ('Cloud', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 57 (kanji: 月) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the kanji 月 mean?',
         '月 means "moon" or "month". Readings include つき (tsuki), げつ (getsu), がつ (gatsu).',
         '月 → moon / month (tsuki / getsu)',
         'The kanji 月 means "moon" or "month".',
         57
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Moon / Month', true, 0),
       ('Year', false, 1),
       ('Sun', false, 2),
       ('Week', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 58 (kanji: 火) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the kanji 火 mean?',
         '火 means "fire". Readings: ひ (hi), か (ka). Also used in 火曜日 (Tuesday).',
         '火 → fire (hi / ka)',
         'The kanji 火 means "fire".',
         58
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Water', false, 0),
       ('Earth', false, 1),
       ('Fire', true, 2),
       ('Wind', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 59 (kanji: 水) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the kanji 水 mean?',
         '水 means "water". Readings: みず (mizu), すい (sui). Also used in 水曜日 (Wednesday).',
         '水 → water (mizu / sui)',
         'The kanji 水 means "water".',
         59
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Fire', false, 0),
       ('Water', true, 1),
       ('Ice', false, 2),
       ('Sea', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 60 (kanji: 木) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the kanji 木 mean?',
         '木 means "tree" or "wood". Readings: き (ki), もく (moku), ぼく (boku).',
         '木 → tree / wood (ki / moku)',
         'The kanji 木 means "tree" or "wood".',
         60
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Tree / Wood', true, 0),
       ('Grass', false, 1),
       ('Flower', false, 2),
       ('Forest', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 61 (kanji: 金) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the kanji 金 mean?',
         '金 means "gold" or "money". Readings: かね (kane), きん (kin). Also used in 金曜日 (Friday).',
         '金 → gold / money (kane / kin)',
         'The kanji 金 means "gold" or "money".',
         61
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Silver', false, 0),
       ('Iron', false, 1),
       ('Gold / Money', true, 2),
       ('Stone', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 62 (kanji: 土) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the kanji 土 mean?',
         '土 means "earth" or "soil". Readings: つち (tsuchi), ど (do), と (to). Also used in 土曜日 (Saturday).',
         '土 → earth / soil (tsuchi / do)',
         'The kanji 土 means "earth" or "soil".',
         62
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Mountain', false, 0),
       ('Earth / Soil', true, 1),
       ('Sand', false, 2),
       ('Rock', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 63 (kanji: 山) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the kanji 山 mean?',
         '山 means "mountain". Readings: やま (yama), さん (san). E.g. 富士山 (Fujisan).',
         '山 → mountain (yama / san)',
         'The kanji 山 means "mountain".',
         63
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Mountain', true, 0),
       ('Hill', false, 1),
       ('Cliff', false, 2),
       ('Valley', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 64 (kanji: 川) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the kanji 川 mean?',
         '川 means "river". Readings: かわ (kawa), せん (sen).',
         '川 → river (kawa / sen)',
         'The kanji 川 means "river".',
         64
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Lake', false, 0),
       ('Sea', false, 1),
       ('River', true, 2),
       ('Pond', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 65 (kanji: 田) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the kanji 田 mean?',
         '田 means "rice field" or "paddy". Reading: た (ta) — common in surnames like 田中 (Tanaka).',
         '田 → rice field (ta / den)',
         'The kanji 田 means "rice field".',
         65
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Garden', false, 0),
       ('Rice field', true, 1),
       ('Forest', false, 2),
       ('Bridge', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 66 (kanji: 大) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the kanji 大 mean?',
         '大 means "big" or "large". Readings: おお (oo), だい (dai), たい (tai).',
         '大 → big / large (oo / dai)',
         'The kanji 大 means "big".',
         66
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Big', true, 0),
       ('Small', false, 1),
       ('Medium', false, 2),
       ('Tall', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 67 (kanji: 小) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the kanji 小 mean?',
         '小 means "small". Readings: ちい(さい) (chiisai), しょう (shou), こ (ko).',
         '小 → small (chiisai / shou)',
         'The kanji 小 means "small".',
         67
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Big', false, 0),
       ('Tiny', false, 1),
       ('Small', true, 2),
       ('Short', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 68 (kanji: 中) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the kanji 中 mean?',
         '中 means "middle", "inside", or "during". Readings: なか (naka), ちゅう (chuu).',
         '中 → middle / inside (naka / chuu)',
         'The kanji 中 means "middle" or "inside".',
         68
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Outside', false, 0),
       ('Middle / Inside', true, 1),
       ('Above', false, 2),
       ('Below', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 69 (kanji: 上) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the kanji 上 mean?',
         '上 means "up" or "above". Readings: うえ (ue), じょう (jou), あ (a-).',
         '上 → up / above (ue / jou)',
         'The kanji 上 means "up" or "above".',
         69
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Down', false, 0),
       ('Up / Above', true, 1),
       ('Left', false, 2),
       ('Right', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 70 (kanji: 下) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the kanji 下 mean?',
         '下 means "down" or "below". Readings: した (shita), か (ka), げ (ge).',
         '下 → down / below (shita / ka)',
         'The kanji 下 means "down" or "below".',
         70
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Up', false, 0),
       ('Inside', false, 1),
       ('Down / Below', true, 2),
       ('Outside', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 71 (kanji: 一) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What number is the kanji 一?',
         '一 is "one". Readings: いち (ichi), ひと(つ) (hitotsu).',
         '一 → 1 (ichi / hitotsu)',
         'The kanji 一 means "one".',
         71
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('1', true, 0),
       ('2', false, 1),
       ('3', false, 2),
       ('10', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 72 (kanji: 二) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What number is the kanji 二?',
         '二 is "two". Readings: に (ni), ふた(つ) (futatsu).',
         '二 → 2 (ni / futatsu)',
         'The kanji 二 means "two".',
         72
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('1', false, 0),
       ('2', true, 1),
       ('3', false, 2),
       ('4', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 73 (kanji: 三) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What number is the kanji 三?',
         '三 is "three". Readings: さん (san), みっ(つ) (mittsu).',
         '三 → 3 (san / mittsu)',
         'The kanji 三 means "three".',
         73
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('2', false, 0),
       ('5', false, 1),
       ('3', true, 2),
       ('4', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 74 (kanji: 四) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What number is the kanji 四?',
         '四 is "four". Readings: し (shi), よん (yon), よっ(つ) (yottsu).',
         '四 → 4 (shi / yon)',
         'The kanji 四 means "four".',
         74
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('4', true, 0),
       ('5', false, 1),
       ('6', false, 2),
       ('3', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 75 (numbers: ichi) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "one" in Japanese?',
         '"Ichi" is the Sino-Japanese reading used for counting and most compounds.',
         '一 (ichi)',
         '"One" in Japanese is "ichi" (一).',
         75
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('ni', false, 0),
       ('ichi', true, 1),
       ('san', false, 2),
       ('shi', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 76 (numbers: ni) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "two" in Japanese?',
         '"Ni" is the Sino-Japanese reading for 二.',
         '二 (ni)',
         '"Two" in Japanese is "ni" (二).',
         76
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('ichi', false, 0),
       ('ni', true, 1),
       ('san', false, 2),
       ('go', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 77 (numbers: san) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "three" in Japanese?',
         '"San" is the standard reading of 三.',
         '三 (san)',
         '"Three" in Japanese is "san" (三).',
         77
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('san', true, 0),
       ('shi', false, 1),
       ('go', false, 2),
       ('ni', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 78 (numbers: shi/yon) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which two readings are both used for "four" in Japanese?',
         '"Shi" is the Sino-Japanese reading but sounds like 死 (death), so "yon" is often preferred.',
         '四 → shi / yon',
         '"Four" can be read "shi" or "yon" — "yon" is often preferred to avoid 死.',
         78
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('shi / yon', true, 0),
       ('go / roku', false, 1),
       ('nana / shichi', false, 2),
       ('hachi / kyuu', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 79 (numbers: go) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "five" in Japanese?',
         '"Go" is the standard reading of 五.',
         '五 (go)',
         '"Five" in Japanese is "go" (五).',
         79
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('roku', false, 0),
       ('go', true, 1),
       ('yon', false, 2),
       ('shichi', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 80 (numbers: roku) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "six" in Japanese?',
         '"Roku" is the standard reading of 六.',
         '六 (roku)',
         '"Six" in Japanese is "roku" (六).',
         80
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('go', false, 0),
       ('shichi', false, 1),
       ('roku', true, 2),
       ('hachi', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 81 (numbers: shichi/nana) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which two readings are both used for "seven" in Japanese?',
         '"Shichi" is the Sino-Japanese reading; "nana" is often preferred for clarity (and to avoid sounding like 一/four).',
         '七 → shichi / nana',
         '"Seven" can be read "shichi" or "nana".',
         81
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('shichi / nana', true, 0),
       ('shi / yon', false, 1),
       ('ku / kyuu', false, 2),
       ('go / roku', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 82 (numbers: hachi) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "eight" in Japanese?',
         '"Hachi" is the standard reading of 八.',
         '八 (hachi)',
         '"Eight" in Japanese is "hachi" (八).',
         82
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('hachi', true, 0),
       ('shichi', false, 1),
       ('kyuu', false, 2),
       ('juu', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 83 (numbers: kyuu/ku) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which two readings are both used for "nine" in Japanese?',
         '"Ku" is the Sino-Japanese reading but sounds like 苦 (suffering), so "kyuu" is often preferred.',
         '九 → kyuu / ku',
         '"Nine" can be read "kyuu" or "ku" — "kyuu" is often preferred.',
         83
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('kyuu / ku', true, 0),
       ('shi / yon', false, 1),
       ('shichi / nana', false, 2),
       ('juu / too', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 84 (numbers: juu) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "ten" in Japanese?',
         '"Juu" is the standard reading of 十.',
         '十 (juu)',
         '"Ten" in Japanese is "juu" (十).',
         84
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('kyuu', false, 0),
       ('juu', true, 1),
       ('hyaku', false, 2),
       ('sen', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 85 (numbers: hyaku) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "one hundred" in Japanese?',
         '"Hyaku" is 百. Note sound changes: 300 = sanbyaku, 600 = roppyaku, 800 = happyaku.',
         '百 (hyaku)',
         '"One hundred" in Japanese is "hyaku" (百).',
         85
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('sen', false, 0),
       ('man', false, 1),
       ('juu', false, 2),
       ('hyaku', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 86 (numbers: sen) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "one thousand" in Japanese?',
         '"Sen" is 千. Note: 3000 = sanzen, 8000 = hassen.',
         '千 (sen)',
         '"One thousand" in Japanese is "sen" (千).',
         86
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('hyaku', false, 0),
       ('sen', true, 1),
       ('man', false, 2),
       ('juu', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 87 (days: getsuyoubi) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does 月曜日 (getsuyoubi) mean?',
         '月 (moon/Monday) + 曜日 (day of the week) = Monday.',
         '月曜日 → Monday (getsuyoubi)',
         '"Getsuyoubi" (月曜日) means "Monday".',
         87
  from modules where slug = 'japanese'
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

-- Question 88 (days: kayoubi) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does 火曜日 (kayoubi) mean?',
         '火 (fire) + 曜日 = Tuesday.',
         '火曜日 → Tuesday (kayoubi)',
         '"Kayoubi" (火曜日) means "Tuesday".',
         88
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Monday', false, 0),
       ('Wednesday', false, 1),
       ('Tuesday', true, 2),
       ('Saturday', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 89 (days: suiyoubi) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does 水曜日 (suiyoubi) mean?',
         '水 (water) + 曜日 = Wednesday.',
         '水曜日 → Wednesday (suiyoubi)',
         '"Suiyoubi" (水曜日) means "Wednesday".',
         89
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Wednesday', true, 0),
       ('Thursday', false, 1),
       ('Tuesday', false, 2),
       ('Friday', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 90 (days: mokuyoubi) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does 木曜日 (mokuyoubi) mean?',
         '木 (tree/wood) + 曜日 = Thursday.',
         '木曜日 → Thursday (mokuyoubi)',
         '"Mokuyoubi" (木曜日) means "Thursday".',
         90
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Thursday', true, 0),
       ('Wednesday', false, 1),
       ('Friday', false, 2),
       ('Saturday', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 91 (days: kinyoubi) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does 金曜日 (kinyoubi) mean?',
         '金 (gold/money) + 曜日 = Friday.',
         '金曜日 → Friday (kinyoubi)',
         '"Kinyoubi" (金曜日) means "Friday".',
         91
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Saturday', false, 0),
       ('Friday', true, 1),
       ('Thursday', false, 2),
       ('Sunday', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 92 (days: doyoubi) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does 土曜日 (doyoubi) mean?',
         '土 (earth) + 曜日 = Saturday.',
         '土曜日 → Saturday (doyoubi)',
         '"Doyoubi" (土曜日) means "Saturday".',
         92
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Friday', false, 0),
       ('Sunday', false, 1),
       ('Saturday', true, 2),
       ('Monday', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 93 (days: nichiyoubi) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does 日曜日 (nichiyoubi) mean?',
         '日 (sun/day) + 曜日 = Sunday.',
         '日曜日 → Sunday (nichiyoubi)',
         '"Nichiyoubi" (日曜日) means "Sunday".',
         93
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Saturday', false, 0),
       ('Monday', false, 1),
       ('Friday', false, 2),
       ('Sunday', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 94 (days: kyou/ashita) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "today" in Japanese?',
         '今日 = today (kyou). Tomorrow = 明日 (ashita), yesterday = 昨日 (kinou).',
         '今日 (kyou) — today',
         '"Today" in Japanese is "kyou" (今日).',
         94
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('ashita', false, 0),
       ('kinou', false, 1),
       ('kyou', true, 2),
       ('asatte', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 95 (months: ichigatsu) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "January" in Japanese?',
         'Months are formed with the number + 月 (gatsu). January = 一月 / 1月 (ichigatsu).',
         '一月 (ichigatsu)',
         '"January" in Japanese is "ichigatsu" (一月).',
         95
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('ichigatsu', true, 0),
       ('nigatsu', false, 1),
       ('shigatsu', false, 2),
       ('juugatsu', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 96 (months: nigatsu) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "February" in Japanese?',
         'February = 二月 / 2月 (nigatsu).',
         '二月 (nigatsu)',
         '"February" in Japanese is "nigatsu" (二月).',
         96
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('ichigatsu', false, 0),
       ('nigatsu', true, 1),
       ('sangatsu', false, 2),
       ('shigatsu', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 97 (months: shigatsu) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "April" in Japanese?',
         'April = 四月 / 4月 (shigatsu) — note "shi" is used here even though "yon" is often preferred for 4.',
         '四月 (shigatsu)',
         '"April" in Japanese is "shigatsu" (四月).',
         97
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('yongatsu', false, 0),
       ('sangatsu', false, 1),
       ('shigatsu', true, 2),
       ('gogatsu', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 98 (months: shichigatsu) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "July" in Japanese?',
         'July = 七月 / 7月 (shichigatsu) — note "shichi" is used here, not "nana".',
         '七月 (shichigatsu)',
         '"July" in Japanese is "shichigatsu" (七月).',
         98
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('nanagatsu', false, 0),
       ('rokugatsu', false, 1),
       ('hachigatsu', false, 2),
       ('shichigatsu', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 99 (months: kugatsu) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "September" in Japanese?',
         'September = 九月 / 9月 (kugatsu) — note "ku" is used here, not "kyuu".',
         '九月 (kugatsu)',
         '"September" in Japanese is "kugatsu" (九月).',
         99
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('kyuugatsu', false, 0),
       ('kugatsu', true, 1),
       ('hachigatsu', false, 2),
       ('juugatsu', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 100 (months: juuichigatsu) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "November" in Japanese?',
         'November = 十一月 / 11月 (juuichigatsu).',
         '十一月 (juuichigatsu)',
         '"November" in Japanese is "juuichigatsu" (十一月).',
         100
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('juugatsu', false, 0),
       ('juunigatsu', false, 1),
       ('juuichigatsu', true, 2),
       ('kugatsu', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 101 (months: juunigatsu) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "December" in Japanese?',
         'December = 十二月 / 12月 (juunigatsu).',
         '十二月 (juunigatsu)',
         '"December" in Japanese is "juunigatsu" (十二月).',
         101
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('juuichigatsu', false, 0),
       ('juunigatsu', true, 1),
       ('juugatsu', false, 2),
       ('ichigatsu', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 102 (time: asa) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "morning" in Japanese?',
         '朝 (asa) = morning. 朝ごはん (asagohan) = breakfast.',
         '朝 (asa) — morning',
         '"Morning" in Japanese is "asa" (朝).',
         102
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('hiru', false, 0),
       ('yoru', false, 1),
       ('asa', true, 2),
       ('ban', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 103 (time: hiru) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "noon" or "daytime" in Japanese?',
         '昼 (hiru) = noon/daytime. 昼ごはん (hirugohan) = lunch.',
         '昼 (hiru) — noon / daytime',
         '"Noon" or "daytime" in Japanese is "hiru" (昼).',
         103
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('asa', false, 0),
       ('hiru', true, 1),
       ('yoru', false, 2),
       ('ban', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 104 (time: yoru) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "night" in Japanese?',
         '夜 (yoru) = night. 夜中 (yonaka) = midnight.',
         '夜 (yoru) — night',
         '"Night" in Japanese is "yoru" (夜).',
         104
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('asa', false, 0),
       ('hiru', false, 1),
       ('yoru', true, 2),
       ('yuugata', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 105 (time: ima) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "now" in Japanese?',
         '今 (ima) = now.',
         '今 (ima) — now',
         '"Now" in Japanese is "ima" (今).',
         105
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('ima', true, 0),
       ('mae', false, 1),
       ('ato', false, 2),
       ('itsu', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 106 (time: nanji) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you ask "What time is it?" in Japanese?',
         '今 (now) + 何時 (nanji = what time) + ですか. Counter 時 (ji) = "o''clock".',
         '今、何時ですか？(Ima, nanji desu ka?)',
         '"What time is it?" in Japanese is "Ima, nanji desu ka?"',
         106
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Doko desu ka?', false, 0),
       ('Nani desu ka?', false, 1),
       ('Nanji desu ka?', true, 2),
       ('Itsu desu ka?', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 107 (time: haru) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "spring" (the season) in Japanese?',
         '春 (haru) = spring.',
         '春 (haru) — spring',
         '"Spring" in Japanese is "haru" (春).',
         107
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('natsu', false, 0),
       ('haru', true, 1),
       ('aki', false, 2),
       ('fuyu', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 108 (time: natsu) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "summer" in Japanese?',
         '夏 (natsu) = summer.',
         '夏 (natsu) — summer',
         '"Summer" in Japanese is "natsu" (夏).',
         108
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('haru', false, 0),
       ('aki', false, 1),
       ('natsu', true, 2),
       ('fuyu', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 109 (time: aki) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "autumn" in Japanese?',
         '秋 (aki) = autumn / fall.',
         '秋 (aki) — autumn',
         '"Autumn" in Japanese is "aki" (秋).',
         109
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('aki', true, 0),
       ('fuyu', false, 1),
       ('haru', false, 2),
       ('natsu', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 110 (time: fuyu) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "winter" in Japanese?',
         '冬 (fuyu) = winter.',
         '冬 (fuyu) — winter',
         '"Winter" in Japanese is "fuyu" (冬).',
         110
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('natsu', false, 0),
       ('aki', false, 1),
       ('haru', false, 2),
       ('fuyu', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 111 (family: otousan) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you address someone else''s father in Japanese?',
         '"Otousan" (お父さん) is the respectful term used for someone else''s father (or your own when speaking with respect). For your own, "chichi" is used when speaking modestly to others.',
         'お父さん (otousan)',
         '"Otousan" (お父さん) is the respectful word for "father".',
         111
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('okaasan', false, 0),
       ('otousan', true, 1),
       ('oniisan', false, 2),
       ('ojiisan', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 112 (family: okaasan) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you address someone else''s mother in Japanese?',
         '"Okaasan" (お母さん) is the respectful term. "Haha" is used when speaking modestly about your own mother.',
         'お母さん (okaasan)',
         '"Okaasan" (お母さん) is the respectful word for "mother".',
         112
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('okaasan', true, 0),
       ('oneesan', false, 1),
       ('obaasan', false, 2),
       ('otousan', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 113 (family: oniisan) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Oniisan" mean?',
         '"Oniisan" (お兄さん) = (someone else''s) older brother. Own = "ani".',
         'お兄さん (oniisan) — older brother',
         '"Oniisan" means "older brother".',
         113
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Older sister', false, 0),
       ('Younger brother', false, 1),
       ('Older brother', true, 2),
       ('Grandfather', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 114 (family: oneesan) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Oneesan" mean?',
         '"Oneesan" (お姉さん) = (someone else''s) older sister. Own = "ane".',
         'お姉さん (oneesan) — older sister',
         '"Oneesan" means "older sister".',
         114
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Older sister', true, 0),
       ('Younger sister', false, 1),
       ('Older brother', false, 2),
       ('Mother', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 115 (family: otouto) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Otouto" mean?',
         '弟 (otouto) = younger brother. Refers to your own younger brother.',
         '弟 (otouto) — younger brother',
         '"Otouto" (弟) means "younger brother".',
         115
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Older brother', false, 0),
       ('Younger brother', true, 1),
       ('Younger sister', false, 2),
       ('Cousin', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 116 (family: imouto) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Imouto" mean?',
         '妹 (imouto) = younger sister.',
         '妹 (imouto) — younger sister',
         '"Imouto" (妹) means "younger sister".',
         116
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Older sister', false, 0),
       ('Younger sister', true, 1),
       ('Younger brother', false, 2),
       ('Niece', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 117 (family: ojiisan) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Ojiisan" mean?',
         'お祖父さん (ojiisan) = grandfather. Note the long "ii" — short "oji" means uncle.',
         'お祖父さん (ojiisan) — grandfather',
         '"Ojiisan" means "grandfather" (note the long "ii").',
         117
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Uncle', false, 0),
       ('Father', false, 1),
       ('Grandfather', true, 2),
       ('Older brother', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 118 (family: obaasan) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Obaasan" mean?',
         'お祖母さん (obaasan) = grandmother. Long "aa" — short "oba" means aunt.',
         'お祖母さん (obaasan) — grandmother',
         '"Obaasan" means "grandmother" (note the long "aa").',
         118
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Aunt', false, 0),
       ('Grandmother', true, 1),
       ('Mother', false, 2),
       ('Older sister', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 119 (family: oji) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Oji-san" (with short "i") mean?',
         '叔父さん/伯父さん (ojisan, short i) = uncle. Long "ii" → grandfather.',
         '叔父さん (ojisan) — uncle',
         '"Ojisan" (short i) means "uncle".',
         119
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Uncle', true, 0),
       ('Grandfather', false, 1),
       ('Older brother', false, 2),
       ('Cousin', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 120 (family: oba) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Oba-san" (with short "a") mean?',
         '叔母さん/伯母さん (obasan, short a) = aunt. Long "aa" → grandmother.',
         '叔母さん (obasan) — aunt',
         '"Obasan" (short a) means "aunt".',
         120
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Aunt', true, 0),
       ('Grandmother', false, 1),
       ('Older sister', false, 2),
       ('Niece', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 121 (family: kazoku) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Kazoku" mean?',
         '家族 (kazoku) = family.',
         '家族 (kazoku) — family',
         '"Kazoku" (家族) means "family".',
         121
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Friend', false, 0),
       ('Family', true, 1),
       ('Couple', false, 2),
       ('Neighbor', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 122 (family: kodomo) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Kodomo" mean?',
         '子供 (kodomo) = child or children.',
         '子供 (kodomo) — child',
         '"Kodomo" (子供) means "child".',
         122
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Adult', false, 0),
       ('Baby', false, 1),
       ('Child', true, 2),
       ('Friend', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 123 (body: atama) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Atama" mean?',
         '頭 (atama) = head.',
         '頭 (atama) — head',
         '"Atama" (頭) means "head".',
         123
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Head', true, 0),
       ('Hand', false, 1),
       ('Heart', false, 2),
       ('Eye', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 124 (body: me) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Me" (目) mean?',
         '目 (me) = eye.',
         '目 (me) — eye',
         '"Me" (目) means "eye".',
         124
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Ear', false, 0),
       ('Eye', true, 1),
       ('Nose', false, 2),
       ('Mouth', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 125 (body: mimi) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Mimi" mean?',
         '耳 (mimi) = ear.',
         '耳 (mimi) — ear',
         '"Mimi" (耳) means "ear".',
         125
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Eye', false, 0),
       ('Nose', false, 1),
       ('Mouth', false, 2),
       ('Ear', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 126 (body: hana) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Hana" (鼻) mean?',
         '鼻 (hana) = nose. Note: 花 (hana) = flower — same romanization, different kanji.',
         '鼻 (hana) — nose',
         '"Hana" (鼻) means "nose".',
         126
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Mouth', false, 0),
       ('Nose', true, 1),
       ('Cheek', false, 2),
       ('Chin', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 127 (body: kuchi) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Kuchi" mean?',
         '口 (kuchi) = mouth.',
         '口 (kuchi) — mouth',
         '"Kuchi" (口) means "mouth".',
         127
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Mouth', true, 0),
       ('Throat', false, 1),
       ('Lip', false, 2),
       ('Tongue', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 128 (body: te) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Te" (手) mean?',
         '手 (te) = hand.',
         '手 (te) — hand',
         '"Te" (手) means "hand".',
         128
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Foot', false, 0),
       ('Hand', true, 1),
       ('Arm', false, 2),
       ('Finger', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 129 (body: ashi) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Ashi" mean?',
         '足 (ashi) = foot/leg. Sometimes 脚 (ashi) specifically for "leg".',
         '足 (ashi) — foot / leg',
         '"Ashi" (足) means "foot" or "leg".',
         129
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Hand', false, 0),
       ('Foot / Leg', true, 1),
       ('Arm', false, 2),
       ('Knee', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 130 (body: kami) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Kami" (髪) mean?',
         '髪 (kami) = hair. Note 紙 (kami) = paper, 神 (kami) = god — homonyms.',
         '髪 (kami) — hair',
         '"Kami" (髪) means "hair" (on the head).',
         130
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Skin', false, 0),
       ('Hair', true, 1),
       ('Bone', false, 2),
       ('Nail', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 131 (body: onaka) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Onaka" mean?',
         'お腹 (onaka) = belly/stomach. "Onaka ga suita" = "I''m hungry".',
         'お腹 (onaka) — belly / stomach',
         '"Onaka" (お腹) means "belly" or "stomach".',
         131
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Chest', false, 0),
       ('Stomach', true, 1),
       ('Back', false, 2),
       ('Hip', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 132 (body: kao) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Kao" mean?',
         '顔 (kao) = face.',
         '顔 (kao) — face',
         '"Kao" (顔) means "face".',
         132
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Head', false, 0),
       ('Face', true, 1),
       ('Neck', false, 2),
       ('Skin', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 133 (colors: akai) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What color is "akai"?',
         '赤い (akai) = red. As a noun: 赤 (aka).',
         '赤い (akai) — red',
         '"Akai" (赤い) means "red".',
         133
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Blue', false, 0),
       ('Green', false, 1),
       ('Red', true, 2),
       ('Yellow', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 134 (colors: aoi) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What color is "aoi"?',
         '青い (aoi) = blue (and traditionally also green for things like traffic lights and fresh leaves).',
         '青い (aoi) — blue',
         '"Aoi" (青い) means "blue".',
         134
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Red', false, 0),
       ('Blue', true, 1),
       ('Purple', false, 2),
       ('White', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 135 (colors: kuroi) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What color is "kuroi"?',
         '黒い (kuroi) = black. As a noun: 黒 (kuro).',
         '黒い (kuroi) — black',
         '"Kuroi" (黒い) means "black".',
         135
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('White', false, 0),
       ('Black', true, 1),
       ('Brown', false, 2),
       ('Gray', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 136 (colors: shiroi) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What color is "shiroi"?',
         '白い (shiroi) = white. As a noun: 白 (shiro).',
         '白い (shiroi) — white',
         '"Shiroi" (白い) means "white".',
         136
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('White', true, 0),
       ('Black', false, 1),
       ('Yellow', false, 2),
       ('Silver', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 137 (colors: kiiroi) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What color is "kiiroi"?',
         '黄色い (kiiroi) = yellow.',
         '黄色い (kiiroi) — yellow',
         '"Kiiroi" (黄色い) means "yellow".',
         137
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Orange', false, 0),
       ('Yellow', true, 1),
       ('Gold', false, 2),
       ('Red', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 138 (colors: midori) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What color is "midori"?',
         '緑 (midori) = green. Note: traditionally things like leaves and traffic lights were also called "aoi" (blue).',
         '緑 (midori) — green',
         '"Midori" (緑) means "green".',
         138
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Blue', false, 0),
       ('Purple', false, 1),
       ('Green', true, 2),
       ('Brown', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 139 (colors: chairo) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What color is "chairo"?',
         '茶色 (chairo) literally "tea color" = brown.',
         '茶色 (chairo) — brown',
         '"Chairo" (茶色) means "brown" (literally "tea color").',
         139
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Green', false, 0),
       ('Brown', true, 1),
       ('Orange', false, 2),
       ('Gray', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 140 (colors: murasaki) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What color is "murasaki"?',
         '紫 (murasaki) = purple.',
         '紫 (murasaki) — purple',
         '"Murasaki" (紫) means "purple".',
         140
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Pink', false, 0),
       ('Purple', true, 1),
       ('Blue', false, 2),
       ('Red', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 141 (colors: pinku) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What color is "pinku"?',
         'ピンク (pinku) = pink — a katakana loanword. Native term: 桃色 (momoiro).',
         'ピンク (pinku) — pink',
         '"Pinku" (ピンク) means "pink" — a loanword.',
         141
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Red', false, 0),
       ('Pink', true, 1),
       ('Purple', false, 2),
       ('Orange', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 142 (colors: orenji) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What color is "orenji"?',
         'オレンジ (orenji) = orange — a katakana loanword. Native term: 橙色 (daidaiiro).',
         'オレンジ (orenji) — orange',
         '"Orenji" (オレンジ) means "orange" — a loanword.',
         142
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Yellow', false, 0),
       ('Red', false, 1),
       ('Orange', true, 2),
       ('Pink', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 143 (food: gohan) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Gohan" mean?',
         'ご飯 (gohan) = cooked rice; also "meal" in general (朝ごはん = breakfast).',
         'ご飯 (gohan) — rice / meal',
         '"Gohan" (ご飯) means "cooked rice" or, by extension, "meal".',
         143
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Bread', false, 0),
       ('Soup', false, 1),
       ('Rice / Meal', true, 2),
       ('Noodles', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 144 (food: mizu) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Mizu" mean?',
         '水 (mizu) = (cold) water. Hot water is お湯 (oyu).',
         '水 (mizu) — water',
         '"Mizu" (水) means "water".',
         144
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Water', true, 0),
       ('Tea', false, 1),
       ('Milk', false, 2),
       ('Juice', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 145 (food: ocha) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Ocha" mean?',
         'お茶 (ocha) = tea (especially Japanese green tea).',
         'お茶 (ocha) — tea',
         '"Ocha" (お茶) means "tea".',
         145
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Coffee', false, 0),
       ('Tea', true, 1),
       ('Water', false, 2),
       ('Soda', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 146 (food: sakana) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Sakana" mean?',
         '魚 (sakana) = fish (the animal or food).',
         '魚 (sakana) — fish',
         '"Sakana" (魚) means "fish".',
         146
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Meat', false, 0),
       ('Vegetable', false, 1),
       ('Egg', false, 2),
       ('Fish', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 147 (food: niku) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Niku" mean?',
         '肉 (niku) = meat. 牛肉 (gyuuniku) = beef, 鶏肉 (toriniku) = chicken meat.',
         '肉 (niku) — meat',
         '"Niku" (肉) means "meat".',
         147
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Meat', true, 0),
       ('Vegetable', false, 1),
       ('Fish', false, 2),
       ('Bread', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 148 (food: yasai) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Yasai" mean?',
         '野菜 (yasai) = vegetables.',
         '野菜 (yasai) — vegetables',
         '"Yasai" (野菜) means "vegetables".',
         148
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Fruit', false, 0),
       ('Meat', false, 1),
       ('Vegetables', true, 2),
       ('Grain', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 149 (food: kudamono) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Kudamono" mean?',
         '果物 (kudamono) = fruit.',
         '果物 (kudamono) — fruit',
         '"Kudamono" (果物) means "fruit".',
         149
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Vegetables', false, 0),
       ('Fruit', true, 1),
       ('Dessert', false, 2),
       ('Snack', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 150 (food: pan) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Pan" mean?',
         'パン (pan) = bread — a loanword from Portuguese "pão".',
         'パン (pan) — bread',
         '"Pan" (パン) means "bread" — borrowed from Portuguese "pão".',
         150
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Bread', true, 0),
       ('Rice', false, 1),
       ('Noodles', false, 2),
       ('Soup', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 151 (food: tamago) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Tamago" mean?',
         '卵 / 玉子 (tamago) = egg.',
         '卵 (tamago) — egg',
         '"Tamago" (卵) means "egg".',
         151
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Milk', false, 0),
       ('Egg', true, 1),
       ('Cheese', false, 2),
       ('Butter', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 152 (food: gyuunyuu) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Gyuunyuu" mean?',
         '牛乳 (gyuunyuu) = cow''s milk. ミルク (miruku) is also commonly used.',
         '牛乳 (gyuunyuu) — milk',
         '"Gyuunyuu" (牛乳) means "milk".',
         152
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Water', false, 0),
       ('Juice', false, 1),
       ('Milk', true, 2),
       ('Tea', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 153 (food: sushi) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is "Sushi"?',
         '寿司 / すし (sushi) = vinegared rice dish, often with fish.',
         '寿司 (sushi)',
         '"Sushi" (寿司) is vinegared rice with fish or other toppings.',
         153
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Grilled meat skewer', false, 0),
       ('Fried noodles', false, 1),
       ('Vinegared rice with fish', true, 2),
       ('Sweet bean cake', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 154 (food: ramen) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is "Ramen"?',
         'ラーメン (raamen) = wheat noodle soup, originally Chinese-influenced.',
         'ラーメン (raamen)',
         '"Ramen" (ラーメン) is a wheat noodle soup dish.',
         154
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A type of sushi', false, 0),
       ('A wheat noodle soup', true, 1),
       ('A rice ball', false, 2),
       ('A fried cutlet', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 155 (animals: inu) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Inu" mean?',
         '犬 (inu) = dog.',
         '犬 (inu) — dog',
         '"Inu" (犬) means "dog".',
         155
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Cat', false, 0),
       ('Dog', true, 1),
       ('Bird', false, 2),
       ('Fish', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 156 (animals: neko) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Neko" mean?',
         '猫 (neko) = cat.',
         '猫 (neko) — cat',
         '"Neko" (猫) means "cat".',
         156
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Dog', false, 0),
       ('Cat', true, 1),
       ('Mouse', false, 2),
       ('Rabbit', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 157 (animals: tori) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Tori" mean?',
         '鳥 (tori) = bird (also "chicken" in food contexts).',
         '鳥 (tori) — bird',
         '"Tori" (鳥) means "bird".',
         157
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Bird', true, 0),
       ('Fish', false, 1),
       ('Insect', false, 2),
       ('Reptile', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 158 (animals: uma) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Uma" mean?',
         '馬 (uma) = horse.',
         '馬 (uma) — horse',
         '"Uma" (馬) means "horse".',
         158
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Cow', false, 0),
       ('Pig', false, 1),
       ('Horse', true, 2),
       ('Sheep', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 159 (animals: ushi) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Ushi" mean?',
         '牛 (ushi) = cow. 牛肉 (gyuuniku) = beef.',
         '牛 (ushi) — cow',
         '"Ushi" (牛) means "cow".',
         159
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Horse', false, 0),
       ('Cow', true, 1),
       ('Pig', false, 2),
       ('Goat', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 160 (animals: buta) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Buta" mean?',
         '豚 (buta) = pig. 豚肉 (butaniku) = pork.',
         '豚 (buta) — pig',
         '"Buta" (豚) means "pig".',
         160
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Pig', true, 0),
       ('Cow', false, 1),
       ('Sheep', false, 2),
       ('Boar', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 161 (animals: hitsuji) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Hitsuji" mean?',
         '羊 (hitsuji) = sheep.',
         '羊 (hitsuji) — sheep',
         '"Hitsuji" (羊) means "sheep".',
         161
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Cow', false, 0),
       ('Goat', false, 1),
       ('Sheep', true, 2),
       ('Pig', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 162 (animals: nezumi) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Nezumi" mean?',
         '鼠 (nezumi) = mouse / rat.',
         '鼠 (nezumi) — mouse / rat',
         '"Nezumi" (鼠) means "mouse" or "rat".',
         162
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Mouse / Rat', true, 0),
       ('Rabbit', false, 1),
       ('Squirrel', false, 2),
       ('Bat', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 163 (animals: kuma) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Kuma" mean?',
         '熊 (kuma) = bear.',
         '熊 (kuma) — bear',
         '"Kuma" (熊) means "bear".',
         163
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Tiger', false, 0),
       ('Bear', true, 1),
       ('Wolf', false, 2),
       ('Fox', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 164 (animals: usagi) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Usagi" mean?',
         '兎 / うさぎ (usagi) = rabbit.',
         '兎 (usagi) — rabbit',
         '"Usagi" (兎) means "rabbit".',
         164
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Mouse', false, 0),
       ('Rabbit', true, 1),
       ('Cat', false, 2),
       ('Deer', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 165 (weather: tenki) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Tenki" mean?',
         '天気 (tenki) = weather. お天気 is also polite.',
         '天気 (tenki) — weather',
         '"Tenki" (天気) means "weather".',
         165
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Sky', false, 0),
       ('Air', false, 1),
       ('Weather', true, 2),
       ('Cloud', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 166 (weather: hare) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Hare" mean (weather)?',
         '晴れ (hare) = clear / sunny weather.',
         '晴れ (hare) — sunny / clear',
         '"Hare" (晴れ) means "sunny" or "clear weather".',
         166
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Sunny / Clear', true, 0),
       ('Cloudy', false, 1),
       ('Rainy', false, 2),
       ('Snowy', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 167 (weather: ame) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Ame" mean?',
         '雨 (ame) = rain. Note: 飴 (ame) = candy — different pitch accent.',
         '雨 (ame) — rain',
         '"Ame" (雨) means "rain".',
         167
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Snow', false, 0),
       ('Rain', true, 1),
       ('Wind', false, 2),
       ('Storm', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 168 (weather: kumori) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Kumori" mean?',
         '曇り (kumori) = cloudy.',
         '曇り (kumori) — cloudy',
         '"Kumori" (曇り) means "cloudy".',
         168
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Sunny', false, 0),
       ('Foggy', false, 1),
       ('Cloudy', true, 2),
       ('Windy', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 169 (weather: yuki) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Yuki" mean?',
         '雪 (yuki) = snow.',
         '雪 (yuki) — snow',
         '"Yuki" (雪) means "snow".',
         169
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Ice', false, 0),
       ('Snow', true, 1),
       ('Hail', false, 2),
       ('Frost', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 170 (weather: atsui) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Atsui" mean (weather)?',
         '暑い (atsui) = hot (weather/air). 熱い (also atsui) = hot to the touch.',
         '暑い (atsui) — hot (weather)',
         '"Atsui" (暑い) means "hot" (when describing weather).',
         170
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Cold', false, 0),
       ('Cool', false, 1),
       ('Warm', false, 2),
       ('Hot', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 171 (weather: samui) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Samui" mean?',
         '寒い (samui) = cold (weather). For things cold to the touch, use 冷たい (tsumetai).',
         '寒い (samui) — cold (weather)',
         '"Samui" (寒い) means "cold weather".',
         171
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Cold', true, 0),
       ('Warm', false, 1),
       ('Hot', false, 2),
       ('Cool', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 172 (weather: suzushii) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Suzushii" mean?',
         '涼しい (suzushii) = cool (pleasantly cool weather).',
         '涼しい (suzushii) — cool',
         '"Suzushii" (涼しい) means "cool" (pleasantly).',
         172
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Cold', false, 0),
       ('Warm', false, 1),
       ('Cool', true, 2),
       ('Hot', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 173 (particle: wa) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the particle は (read "wa") do?',
         'は (wa) marks the topic of the sentence. Written with the hiragana for "ha" but read "wa".',
         'は (wa) — topic particle',
         'The particle は (wa) marks the topic of a sentence.',
         173
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Marks the topic', true, 0),
       ('Marks the direct object', false, 1),
       ('Marks the subject', false, 2),
       ('Marks the location', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 174 (particle: ga) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the particle が do?',
         'が (ga) marks the grammatical subject — used for new info, exhaustive listings, and with verbs like ある/いる.',
         'が (ga) — subject particle',
         'The particle が (ga) marks the grammatical subject.',
         174
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Marks the topic', false, 0),
       ('Marks the subject', true, 1),
       ('Marks possession', false, 2),
       ('Marks the destination', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 175 (particle: wo) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the particle を do?',
         'を (read "o", though spelled "wo") marks the direct object of a transitive verb.',
         'を (o) — direct object particle',
         'The particle を marks the direct object.',
         175
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Marks the subject', false, 0),
       ('Marks the direct object', true, 1),
       ('Marks the location', false, 2),
       ('Marks the topic', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 176 (particle: ni) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which is a primary use of the particle に?',
         'に (ni) marks direction/destination, indirect object, time, and existence location with ある/いる.',
         'に — destination / time / indirect object',
         'The particle に marks destinations, times, or indirect objects.',
         176
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Direct object', false, 0),
       ('Destination / Time', true, 1),
       ('Topic', false, 2),
       ('Quotation', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 177 (particle: de) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which is a primary use of the particle で?',
         'で (de) marks the location of an action ("at"), the means/instrument ("by"), and the cause.',
         'で — location of action / means',
         'The particle で marks where an action takes place or the means used.',
         177
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Direction', false, 0),
       ('Subject', false, 1),
       ('Location of action / Means', true, 2),
       ('Possession', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 178 (particle: e/he) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the particle へ (read "e") indicate?',
         'へ (e) indicates direction toward a destination — similar to に but emphasizes movement direction.',
         'へ (e) — direction toward',
         'The particle へ indicates direction toward a destination.',
         178
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Direction toward', true, 0),
       ('Means', false, 1),
       ('Direct object', false, 2),
       ('Topic', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 179 (particle: to) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which is a primary use of the particle と?',
         'と (to) means "and" (between nouns, exhaustive) and "with" (companion); also marks quoted speech/thought.',
         'と — and / with / quotative',
         'The particle と means "and" between nouns or "with" for companions.',
         179
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Subject', false, 0),
       ('And / With', true, 1),
       ('From', false, 2),
       ('At', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 180 (particle: mo) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the particle も mean?',
         'も (mo) = "also / too". Replaces は or が when adding the meaning "also".',
         'も — also / too',
         'The particle も means "also" or "too".',
         180
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Or', false, 0),
       ('But', false, 1),
       ('Also / Too', true, 2),
       ('Only', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 181 (particle: kara) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the particle から mean?',
         'から (kara) = "from" (place/time) or "because" (after a clause).',
         'から — from / because',
         'The particle から means "from" or "because".',
         181
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('To', false, 0),
       ('From / Because', true, 1),
       ('And', false, 2),
       ('Also', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 182 (particle: made) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the particle まで mean?',
         'まで (made) = "until / as far as" — an end point in time or space.',
         'まで — until / up to',
         'The particle まで means "until" or "up to".',
         182
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Until / Up to', true, 0),
       ('From', false, 1),
       ('At', false, 2),
       ('And', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 183 (particle: no) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the particle の primarily indicate?',
         'の (no) connects two nouns, marking possession or modification: 私の本 (watashi no hon) = "my book".',
         'の — possession / modifies noun',
         'The particle の links nouns to show possession or modification.',
         183
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Direct object', false, 0),
       ('Possession / Noun modifier', true, 1),
       ('Subject', false, 2),
       ('Direction', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 184 (particle: ka) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the sentence-ending particle か do?',
         'か (ka) turns a statement into a question. No question mark is needed in writing.',
         'か — turns sentence into a question',
         'The particle か at the end of a sentence makes it a question.',
         184
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Confirms a fact', false, 0),
       ('Turns sentence into a question', true, 1),
       ('Expresses surprise', false, 2),
       ('Emphasizes', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 185 (particle: ne) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the sentence-ending particle ね do?',
         'ね (ne) seeks agreement or confirmation, similar to "right?" or "isn''t it?".',
         'ね — seeks agreement (right?)',
         'The particle ね seeks confirmation/agreement, like "right?".',
         185
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Right? (seeks agreement)', true, 0),
       ('Question marker', false, 1),
       ('Strong assertion', false, 2),
       ('Hesitation', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 186 (particle: yo) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the sentence-ending particle よ do?',
         'よ (yo) asserts info the listener may not know, similar to "you know" or an exclamation.',
         'よ — asserts new info (you know)',
         'The particle よ asserts new info to the listener.',
         186
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Question', false, 0),
       ('Seeks agreement', false, 1),
       ('Asserts new info', true, 2),
       ('Possession', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 187 (particle: ya) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the particle や mean?',
         'や (ya) lists nouns non-exhaustively ("and...etc."), unlike と which is exhaustive.',
         'や — and (non-exhaustive list)',
         'The particle や lists nouns non-exhaustively, e.g. "X や Y..." = "X, Y, etc.".',
         187
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('And (exhaustive)', false, 0),
       ('Or', false, 1),
       ('And (non-exhaustive, etc.)', true, 2),
       ('But', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 188 (verb: taberu) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Taberu" (食べる) mean?',
         '食べる (taberu) = to eat. Ru-verb (ichidan).',
         '食べる (taberu) — to eat',
         '"Taberu" (食べる) means "to eat".',
         188
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('To drink', false, 0),
       ('To eat', true, 1),
       ('To see', false, 2),
       ('To go', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 189 (verb: nomu) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Nomu" (飲む) mean?',
         '飲む (nomu) = to drink. U-verb (godan).',
         '飲む (nomu) — to drink',
         '"Nomu" (飲む) means "to drink".',
         189
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('To eat', false, 0),
       ('To drink', true, 1),
       ('To buy', false, 2),
       ('To read', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 190 (verb: miru) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Miru" (見る) mean?',
         '見る (miru) = to see / look / watch. Ru-verb (ichidan).',
         '見る (miru) — to see / watch',
         '"Miru" (見る) means "to see" or "to watch".',
         190
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('To listen', false, 0),
       ('To see / watch', true, 1),
       ('To read', false, 2),
       ('To say', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 191 (verb: suru) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Suru" (する) mean?',
         'する (suru) = to do. Irregular verb. Combines with many nouns (e.g. 勉強する = to study).',
         'する (suru) — to do',
         '"Suru" (する) means "to do" — an irregular verb.',
         191
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('To do', true, 0),
       ('To be', false, 1),
       ('To make', false, 2),
       ('To go', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 192 (verb: kuru) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Kuru" (来る) mean?',
         '来る (kuru) = to come. Irregular verb. Polite: 来ます (kimasu).',
         '来る (kuru) — to come',
         '"Kuru" (来る) means "to come" — irregular.',
         192
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('To go', false, 0),
       ('To come', true, 1),
       ('To return', false, 2),
       ('To enter', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 193 (verb: iku) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Iku" (行く) mean?',
         '行く (iku) = to go. U-verb but with an irregular te-form: 行って (itte), not "iite".',
         '行く (iku) — to go',
         '"Iku" (行く) means "to go" — te-form is 行って (itte), irregular.',
         193
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('To come', false, 0),
       ('To leave', false, 1),
       ('To go', true, 2),
       ('To return', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 194 (verb: kaeru) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Kaeru" (帰る) mean?',
         '帰る (kaeru) = to return home / to go back. Note: it''s a u-verb despite ending in -eru.',
         '帰る (kaeru) — to return / go home',
         '"Kaeru" (帰る) means "to return" or "to go home" — u-verb despite -eru ending.',
         194
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('To return / go home', true, 0),
       ('To change', false, 1),
       ('To leave', false, 2),
       ('To stay', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 195 (verb: kau) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Kau" (買う) mean?',
         '買う (kau) = to buy. U-verb.',
         '買う (kau) — to buy',
         '"Kau" (買う) means "to buy".',
         195
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('To sell', false, 0),
       ('To buy', true, 1),
       ('To pay', false, 2),
       ('To use', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 196 (verb: yomu) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Yomu" (読む) mean?',
         '読む (yomu) = to read. U-verb.',
         '読む (yomu) — to read',
         '"Yomu" (読む) means "to read".',
         196
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('To write', false, 0),
       ('To say', false, 1),
       ('To read', true, 2),
       ('To listen', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 197 (verb: kaku) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Kaku" (書く) mean?',
         '書く (kaku) = to write. U-verb.',
         '書く (kaku) — to write',
         '"Kaku" (書く) means "to write".',
         197
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('To read', false, 0),
       ('To write', true, 1),
       ('To draw', false, 2),
       ('To erase', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 198 (verb: hanasu) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Hanasu" (話す) mean?',
         '話す (hanasu) = to speak / talk. U-verb.',
         '話す (hanasu) — to speak / talk',
         '"Hanasu" (話す) means "to speak" or "to talk".',
         198
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('To speak', true, 0),
       ('To listen', false, 1),
       ('To read', false, 2),
       ('To shout', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 199 (verb: kiku) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Kiku" (聞く) mean?',
         '聞く (kiku) = to listen / hear / ask. U-verb.',
         '聞く (kiku) — to listen / ask',
         '"Kiku" (聞く) means "to listen", "hear", or "ask".',
         199
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('To speak', false, 0),
       ('To listen / ask', true, 1),
       ('To see', false, 2),
       ('To call', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 200 (masu: tabemasu) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the polite (masu-form) of 食べる (taberu)?',
         'Ru-verb: drop る, add ます → 食べます (tabemasu).',
         '食べます (tabemasu)',
         'The masu-form of 食べる is 食べます (tabemasu).',
         200
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('taberumasu', false, 0),
       ('tabemasu', true, 1),
       ('tabimasu', false, 2),
       ('taberimasu', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 201 (masu: nomimasu) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the masu-form of 飲む (nomu)?',
         'U-verb: change む to み, then add ます → 飲みます (nomimasu).',
         '飲みます (nomimasu)',
         'The masu-form of 飲む is 飲みます (nomimasu).',
         201
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('nomumasu', false, 0),
       ('nomemasu', false, 1),
       ('nomimasu', true, 2),
       ('nondemasu', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 202 (masu: shimasu) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the masu-form of する (suru)?',
         'Irregular: する → します (shimasu).',
         'します (shimasu)',
         'The masu-form of する is します (shimasu).',
         202
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('surumasu', false, 0),
       ('sumasu', false, 1),
       ('shimasu', true, 2),
       ('suremasu', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 203 (masu: kimasu) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the masu-form of 来る (kuru)?',
         'Irregular: 来る → 来ます (kimasu). The reading of 来 changes from "ku" to "ki".',
         '来ます (kimasu)',
         'The masu-form of 来る is 来ます (kimasu).',
         203
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('kurimasu', false, 0),
       ('kuremasu', false, 1),
       ('kimasu', true, 2),
       ('koimasu', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 204 (masu: ikimasu) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the masu-form of 行く (iku)?',
         'U-verb: く → き, then add ます → 行きます (ikimasu).',
         '行きます (ikimasu)',
         'The masu-form of 行く is 行きます (ikimasu).',
         204
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('ikumasu', false, 0),
       ('ikimasu', true, 1),
       ('itimasu', false, 2),
       ('ittemasu', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 205 (past: tabemashita) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "I ate" politely in Japanese?',
         'Polite past = masu-form base + ました. 食べます → 食べました (tabemashita).',
         '食べました (tabemashita)',
         '"I ate" (polite) = 食べました (tabemashita).',
         205
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('tabemasu', false, 0),
       ('tabemashita', true, 1),
       ('tabenakatta', false, 2),
       ('tabeta', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 206 (past: nomimashita) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "I drank" politely?',
         '飲みます → 飲みました (nomimashita).',
         '飲みました (nomimashita)',
         '"I drank" (polite) = 飲みました (nomimashita).',
         206
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('nomimasu', false, 0),
       ('nondemashita', false, 1),
       ('nomimashita', true, 2),
       ('nonda', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 207 (past: ikimashita) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "I went" politely?',
         '行きます → 行きました (ikimashita).',
         '行きました (ikimashita)',
         '"I went" (polite) = 行きました (ikimashita).',
         207
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('ikimasen', false, 0),
       ('ikimashita', true, 1),
       ('itta', false, 2),
       ('ikemasu', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 208 (past: shimashita) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "I did" politely?',
         'します → しました (shimashita).',
         'しました (shimashita)',
         '"I did" (polite) = しました (shimashita).',
         208
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('shita', false, 0),
       ('shimashita', true, 1),
       ('shimasen', false, 2),
       ('sumashita', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 209 (past: kimashita) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "I came" politely?',
         '来ます → 来ました (kimashita).',
         '来ました (kimashita)',
         '"I came" (polite) = 来ました (kimashita).',
         209
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('kimasen', false, 0),
       ('kita', false, 1),
       ('kimashita', true, 2),
       ('kurimashita', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 210 (neg: tabemasen) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "I don''t eat" politely?',
         'Polite negative = masu-form base + ません. 食べます → 食べません (tabemasen).',
         '食べません (tabemasen)',
         '"I don''t eat" (polite) = 食べません (tabemasen).',
         210
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('tabemasen', true, 0),
       ('tabemashita', false, 1),
       ('tabenai', false, 2),
       ('taberunai', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 211 (neg: ikimasen) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "I don''t go" politely?',
         '行きます → 行きません (ikimasen).',
         '行きません (ikimasen)',
         '"I don''t go" (polite) = 行きません (ikimasen).',
         211
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('ikenai', false, 0),
       ('ikanai', false, 1),
       ('ikimasen', true, 2),
       ('ikimasendeshita', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 212 (neg past: tabemasendeshita) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "I didn''t eat" politely?',
         'Polite negative past = masu-form base + ませんでした. → 食べませんでした (tabemasen deshita).',
         '食べませんでした (tabemasen deshita)',
         '"I didn''t eat" (polite) = 食べませんでした.',
         212
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('tabemashita', false, 0),
       ('tabemasen deshita', true, 1),
       ('tabenakatta desu', false, 2),
       ('tabemasen', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 213 (te-form: tabete) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the te-form of 食べる (taberu)?',
         'Ru-verb: drop る, add て → 食べて (tabete). Used for "and then", "please do", continuous forms.',
         '食べて (tabete)',
         'The te-form of 食べる is 食べて (tabete).',
         213
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('tabete', true, 0),
       ('tabeta', false, 1),
       ('tabette', false, 2),
       ('taberunde', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 214 (te-form: nonde) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the te-form of 飲む (nomu)?',
         'U-verb ending in む → んで. 飲む → 飲んで (nonde).',
         '飲んで (nonde)',
         'The te-form of 飲む is 飲んで (nonde).',
         214
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('nomite', false, 0),
       ('nomite', false, 1),
       ('nonde', true, 2),
       ('nomete', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 215 (te-form: itte) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the te-form of 行く (iku)?',
         '行く is irregular: 行って (itte), not "iite". This is a memorable exception.',
         '行って (itte)',
         'The te-form of 行く is 行って (itte) — irregular.',
         215
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('iite', false, 0),
       ('ikite', false, 1),
       ('iite', false, 2),
       ('itte', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 216 (te-form: shite) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the te-form of する (suru)?',
         'する → して (shite). Irregular.',
         'して (shite)',
         'The te-form of する is して (shite).',
         216
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('shitte', false, 0),
       ('shite', true, 1),
       ('shute', false, 2),
       ('surute', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 217 (te-form: kite) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the te-form of 来る (kuru)?',
         '来る → 来て (kite). Irregular.',
         '来て (kite)',
         'The te-form of 来る is 来て (kite).',
         217
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('kute', false, 0),
       ('kite', true, 1),
       ('koite', false, 2),
       ('kitte', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 218 (te-form: kaite) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the te-form of 書く (kaku)?',
         'U-verb ending in く → いて. 書く → 書いて (kaite). (Exception: 行く → 行って.)',
         '書いて (kaite)',
         'The te-form of 書く is 書いて (kaite).',
         218
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('kakute', false, 0),
       ('katte', false, 1),
       ('kaite', true, 2),
       ('kakkite', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 219 (past plain: tabeta) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the plain past form of 食べる (taberu)?',
         'Ru-verb: drop る, add た → 食べた (tabeta). Used in casual speech and before nouns.',
         '食べた (tabeta)',
         'The plain past of 食べる is 食べた (tabeta).',
         219
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('tabete', false, 0),
       ('tabeta', true, 1),
       ('taberu', false, 2),
       ('tabenai', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 220 (past plain: nonda) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the plain past form of 飲む (nomu)?',
         'Same sound change as te-form: む → んだ. 飲む → 飲んだ (nonda).',
         '飲んだ (nonda)',
         'The plain past of 飲む is 飲んだ (nonda).',
         220
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('nomeda', false, 0),
       ('nomatta', false, 1),
       ('nonda', true, 2),
       ('nomita', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 221 (neg plain: tabenai) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the plain negative of 食べる (taberu)?',
         'Ru-verb: drop る, add ない → 食べない (tabenai).',
         '食べない (tabenai)',
         'The plain negative of 食べる is 食べない (tabenai).',
         221
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('tabenai', true, 0),
       ('tabaranai', false, 1),
       ('taberanai', false, 2),
       ('tabewanai', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 222 (neg plain: nomanai) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the plain negative of 飲む (nomu)?',
         'U-verb: む → ま, add ない → 飲まない (nomanai).',
         '飲まない (nomanai)',
         'The plain negative of 飲む is 飲まない (nomanai).',
         222
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('nominai', false, 0),
       ('nomanai', true, 1),
       ('nomenai', false, 2),
       ('nomunai', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 223 (neg plain: konai) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the plain negative of 来る (kuru)?',
         'Irregular: 来る → 来ない (konai). The reading of 来 shifts to "ko".',
         '来ない (konai)',
         'The plain negative of 来る is 来ない (konai).',
         223
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('kinai', false, 0),
       ('kuranai', false, 1),
       ('konai', true, 2),
       ('kurunai', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 224 (neg plain: shinai) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the plain negative of する (suru)?',
         'Irregular: する → しない (shinai).',
         'しない (shinai)',
         'The plain negative of する is しない (shinai).',
         224
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('surunai', false, 0),
       ('shinai', true, 1),
       ('sanai', false, 2),
       ('senai', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 225 (i-adj: oishii) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Oishii" mean?',
         '美味しい (oishii) = tasty / delicious. I-adjective.',
         '美味しい (oishii) — delicious',
         '"Oishii" (美味しい) means "delicious".',
         225
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Bitter', false, 0),
       ('Spicy', false, 1),
       ('Delicious', true, 2),
       ('Awful', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 226 (i-adj: mazui) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Mazui" mean?',
         '不味い (mazui) = bad-tasting (the opposite of oishii). I-adjective.',
         '不味い (mazui) — bad-tasting',
         '"Mazui" (不味い) means "bad-tasting".',
         226
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Tasty', false, 0),
       ('Bad-tasting', true, 1),
       ('Sweet', false, 2),
       ('Sour', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 227 (i-adj: takai) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Takai" mean?',
         '高い (takai) = expensive or tall/high. I-adjective.',
         '高い (takai) — expensive / tall',
         '"Takai" (高い) means "expensive" or "tall/high".',
         227
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Cheap', false, 0),
       ('Short', false, 1),
       ('Expensive / Tall', true, 2),
       ('Wide', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 228 (i-adj: yasui) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Yasui" mean?',
         '安い (yasui) = cheap / inexpensive. I-adjective.',
         '安い (yasui) — cheap',
         '"Yasui" (安い) means "cheap".',
         228
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Cheap', true, 0),
       ('Expensive', false, 1),
       ('Easy', false, 2),
       ('Soft', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 229 (i-adj: ookii) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Ookii" mean?',
         '大きい (ookii) = big / large. I-adjective.',
         '大きい (ookii) — big',
         '"Ookii" (大きい) means "big".',
         229
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Big', true, 0),
       ('Small', false, 1),
       ('Tall', false, 2),
       ('Wide', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 230 (i-adj: chiisai) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Chiisai" mean?',
         '小さい (chiisai) = small. I-adjective.',
         '小さい (chiisai) — small',
         '"Chiisai" (小さい) means "small".',
         230
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Big', false, 0),
       ('Small', true, 1),
       ('Short', false, 2),
       ('Thin', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 231 (i-adj: hayai) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Hayai" mean?',
         '早い (hayai) = early; 速い (also hayai) = fast.',
         '早い / 速い (hayai) — early / fast',
         '"Hayai" means "early" (早い) or "fast" (速い).',
         231
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Slow', false, 0),
       ('Late', false, 1),
       ('Early / Fast', true, 2),
       ('Loud', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 232 (i-adj: omoshiroi) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Omoshiroi" mean?',
         '面白い (omoshiroi) = interesting / funny.',
         '面白い (omoshiroi) — interesting / funny',
         '"Omoshiroi" (面白い) means "interesting" or "funny".',
         232
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Boring', false, 0),
       ('Interesting / Funny', true, 1),
       ('Difficult', false, 2),
       ('Strange', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 233 (na-adj: kirei) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Kirei" mean?',
         '綺麗 / きれい (kirei) = pretty / clean. Na-adjective despite ending in -i.',
         'きれい (kirei) — pretty / clean',
         '"Kirei" means "pretty" or "clean" — a na-adjective.',
         233
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Dirty', false, 0),
       ('Pretty / Clean', true, 1),
       ('Ugly', false, 2),
       ('Big', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 234 (na-adj: genki) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Genki" mean?',
         '元気 (genki) = healthy / energetic / well. "お元気ですか？" = "How are you?".',
         '元気 (genki) — healthy / energetic',
         '"Genki" (元気) means "healthy" or "in good spirits".',
         234
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Tired', false, 0),
       ('Sick', false, 1),
       ('Healthy / Energetic', true, 2),
       ('Bored', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 235 (na-adj: shizuka) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Shizuka" mean?',
         '静か (shizuka) = quiet. Na-adjective.',
         '静か (shizuka) — quiet',
         '"Shizuka" (静か) means "quiet" — a na-adjective.',
         235
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Loud', false, 0),
       ('Quiet', true, 1),
       ('Busy', false, 2),
       ('Lively', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 236 (na-adj: suki) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Suki" mean?',
         '好き (suki) = liked / favorite. Na-adjective. Object marked by が: "ねこが好きです" = "I like cats".',
         '好き (suki) — liked / favorite',
         '"Suki" (好き) means "liked" — used with が.',
         236
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Disliked', false, 0),
       ('Liked / Favorite', true, 1),
       ('Hated', false, 2),
       ('Loved (romantically)', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 237 (na-adj: kantan) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Kantan" mean?',
         '簡単 (kantan) = easy / simple. Na-adjective.',
         '簡単 (kantan) — easy / simple',
         '"Kantan" (簡単) means "easy" — a na-adjective.',
         237
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Hard', false, 0),
       ('Easy', true, 1),
       ('Strange', false, 2),
       ('New', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 238 (counter: nin) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which counter is used for counting people?',
         '〜人 (nin) is the counter for people. Exceptions: 1 person = 一人 (hitori), 2 people = 二人 (futari).',
         '〜人 (nin) — people',
         'The counter for people is 〜人 (nin) — 1 and 2 use hitori/futari.',
         238
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('〜人 (nin)', true, 0),
       ('〜本 (hon)', false, 1),
       ('〜枚 (mai)', false, 2),
       ('〜匹 (hiki)', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 239 (counter: hon) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which counter is used for long, cylindrical objects (bottles, pens, etc.)?',
         '〜本 (hon) is the counter for long thin objects. Sound changes: 1 = ippon, 3 = sanbon, 6 = roppon, 8 = happon.',
         '〜本 (hon) — long thin objects',
         'The counter for long cylindrical objects is 〜本 (hon).',
         239
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('〜枚 (mai)', false, 0),
       ('〜本 (hon)', true, 1),
       ('〜個 (ko)', false, 2),
       ('〜冊 (satsu)', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 240 (counter: mai) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which counter is used for thin flat objects (paper, plates, shirts)?',
         '〜枚 (mai) is the counter for flat thin objects.',
         '〜枚 (mai) — thin flat objects',
         'The counter for flat thin objects is 〜枚 (mai).',
         240
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('〜本 (hon)', false, 0),
       ('〜匹 (hiki)', false, 1),
       ('〜枚 (mai)', true, 2),
       ('〜杯 (hai)', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 241 (counter: ko) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which counter is the generic counter for small/round objects?',
         '〜個 (ko) is the general counter for small objects like fruit, balls, eggs.',
         '〜個 (ko) — small objects',
         'The general counter for small objects is 〜個 (ko).',
         241
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('〜枚 (mai)', false, 0),
       ('〜冊 (satsu)', false, 1),
       ('〜匹 (hiki)', false, 2),
       ('〜個 (ko)', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 242 (question word: nani) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Nani" (何) mean?',
         '何 = what. Read "nani" alone or before n/d/t (なんですか = nan desu ka).',
         '何 (nani / nan) — what',
         '"Nani" (何) means "what".',
         242
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Where', false, 0),
       ('What', true, 1),
       ('Who', false, 2),
       ('When', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 243 (question word: dare) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Dare" (誰) mean?',
         '誰 (dare) = who. Polite version: どなた (donata).',
         '誰 (dare) — who',
         '"Dare" (誰) means "who".',
         243
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('What', false, 0),
       ('When', false, 1),
       ('Who', true, 2),
       ('Where', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 244 (question word: doko) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Doko" mean?',
         'どこ (doko) = where. Polite version: どちら (dochira).',
         'どこ (doko) — where',
         '"Doko" (どこ) means "where".',
         244
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Where', true, 0),
       ('Who', false, 1),
       ('What', false, 2),
       ('How', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 245 (question word: itsu) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Itsu" mean?',
         'いつ (itsu) = when. Does NOT take the particle に.',
         'いつ (itsu) — when',
         '"Itsu" (いつ) means "when" — used without に.',
         245
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Why', false, 0),
       ('When', true, 1),
       ('How', false, 2),
       ('Where', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 246 (question word: ikura) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Ikura" mean?',
         'いくら (ikura) = how much (price). "いくらですか？" = "How much is it?".',
         'いくら (ikura) — how much',
         '"Ikura" (いくら) means "how much" (price).',
         246
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('How many', false, 0),
       ('How much (price)', true, 1),
       ('Why', false, 2),
       ('How', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 247 (pronoun: watashi) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Watashi" (私) mean?',
         '私 (watashi) = I / me. Neutral and polite. Casual men''s = 僕 (boku), rough men''s = 俺 (ore).',
         '私 (watashi) — I / me',
         '"Watashi" (私) means "I" or "me" — neutral polite.',
         247
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('You', false, 0),
       ('He', false, 1),
       ('I / me', true, 2),
       ('We', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 248 (pronoun: anata) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "Anata" mean?',
         'あなた (anata) = you. Often avoided in Japanese — using the person''s name + さん is more polite.',
         'あなた (anata) — you',
         '"Anata" (あなた) means "you" — but using the person''s name is preferred.',
         248
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('I', false, 0),
       ('You', true, 1),
       ('They', false, 2),
       ('We', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 249 (pronoun: kare/kanojo) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What do "Kare" (彼) and "Kanojo" (彼女) mean?',
         '彼 (kare) = he / boyfriend. 彼女 (kanojo) = she / girlfriend.',
         '彼 / 彼女 — he / she',
         '"Kare" (彼) is "he/boyfriend"; "Kanojo" (彼女) is "she/girlfriend".',
         249
  from modules where slug = 'japanese'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('he / she', true, 0),
       ('we / they', false, 1),
       ('this / that', false, 2),
       ('here / there', false, 3)
     ) as c(label, is_correct, order_index);

-- BATCH_2_PLACEHOLDER
