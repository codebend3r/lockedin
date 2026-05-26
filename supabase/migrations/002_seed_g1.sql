-- 002_seed_g1.sql
-- G1 Driver's Test module: 20 signs + 20 rules questions

insert into modules (slug, name, description, type, total_questions)
values (
  'g1',
  'G1 Driver''s Test',
  'Ontario G1 written knowledge test — signs and rules of the road.',
  'static',
  40
);

-- ─────────────────────────────────────────────────── SIGNS (order_index 0–19)

-- Question 1 (signs, index 0) ─────────────────────────────────────────────────
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, 'signs',
         'What does a red octagonal sign mean?',
         'A red octagon is the universal stop sign. You must come to a complete stop at the marked line before proceeding.',
         'Stop completely',
         'A red octagonal sign means "Stop" — you must come to a complete stop at the stop line or crosswalk, then proceed only when it is safe.',
         0
  from modules where slug = 'g1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Stop completely',                       true,  0),
       ('Yield to oncoming traffic',             false, 1),
       ('Slow down and proceed with caution',    false, 2),
       ('Do not enter this road',                false, 3)
     ) as c(label, is_correct, order_index);

-- Question 2 (signs, index 1) ─────────────────────────────────────────────────
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, 'signs',
         'What does a downward-pointing triangular sign with a red border mean?',
         'The inverted triangle is the yield sign. You must slow down and give the right-of-way to traffic already in the intersection or crossing your path.',
         'Yield — give way',
         'A downward-pointing triangular sign with a red border means "Yield" — slow down and give the right-of-way to other traffic before entering the intersection.',
         1
  from modules where slug = 'g1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Yield — slow down and give way to traffic',         true,  0),
       ('Stop and wait for a green light',                   false, 1),
       ('Come to a complete stop before proceeding',         false, 2),
       ('Speed up to merge with traffic',                    false, 3)
     ) as c(label, is_correct, order_index);

-- Question 3 (signs, index 2) ─────────────────────────────────────────────────
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, 'signs',
         'What does a round red sign with a white horizontal bar mean?',
         'This is the "Do Not Enter" sign. You must not enter the road or lane in that direction — it is often posted at the exit of one-way streets.',
         'Do not enter',
         'A round red sign with a white horizontal bar means "Do Not Enter" — you are prohibited from entering that road or lane, typically because traffic flows the opposite way.',
         2
  from modules where slug = 'g1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Do not enter',                            true,  0),
       ('Stop ahead',                              false, 1),
       ('Wrong way — turn around',                 false, 2),
       ('Road closed for construction',            false, 3)
     ) as c(label, is_correct, order_index);

-- Question 4 (signs, index 3) ─────────────────────────────────────────────────
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, 'signs',
         'What does a rectangular white sign with a red circle and slash over a U-shaped arrow mean?',
         'The red circle and slash is the universal prohibition symbol. Over a U-shaped arrow it means U-turns are forbidden at that location.',
         'No U-turns',
         'A white sign with a red circle and slash over a U-turn arrow means "No U-Turn" — making a U-turn at that location is prohibited.',
         3
  from modules where slug = 'g1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('No U-turns permitted',                   true,  0),
       ('No left turns permitted',                false, 1),
       ('No turns of any kind',                   false, 2),
       ('One-way traffic ahead',                  false, 3)
     ) as c(label, is_correct, order_index);

-- Question 5 (signs, index 4) ─────────────────────────────────────────────────
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, 'signs',
         'What does a white sign with a red circle and slash over a left-pointing arrow mean?',
         'The red circle and slash over a left arrow means left turns are prohibited at that intersection. You must go straight or turn right.',
         'No left turns',
         'A white sign with a red circle and slash over a left-pointing arrow means "No Left Turn" — turning left at that intersection is prohibited.',
         4
  from modules where slug = 'g1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('No left turn permitted',                 true,  0),
       ('No U-turn permitted',                    false, 1),
       ('One-way street ahead',                   false, 2),
       ('No right turn permitted',                false, 3)
     ) as c(label, is_correct, order_index);

-- Question 6 (signs, index 5) ─────────────────────────────────────────────────
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, 'signs',
         'What does a white sign with a red circle and slash over a right-pointing arrow mean?',
         'The red circle and slash over a right arrow means right turns are prohibited at that intersection. You must go straight or turn left.',
         'No right turns',
         'A white sign with a red circle and slash over a right-pointing arrow means "No Right Turn" — turning right at that intersection is prohibited.',
         5
  from modules where slug = 'g1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('No right turn permitted',                true,  0),
       ('No left turn permitted',                 false, 1),
       ('Merge right ahead',                      false, 2),
       ('No U-turn permitted',                    false, 3)
     ) as c(label, is_correct, order_index);

-- Question 7 (signs, index 6) ─────────────────────────────────────────────────
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, 'signs',
         'What does a fluorescent yellow-green sign showing children walking mean?',
         'Fluorescent yellow-green is reserved for pedestrian and school zone hazards. This sign warns you are near a school zone and children may be crossing.',
         'School zone — watch for children',
         'A fluorescent yellow-green sign showing children walking indicates a school zone. Drivers must slow to the posted speed and watch carefully for children crossing the road.',
         6
  from modules where slug = 'g1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('School zone — watch for children',       true,  0),
       ('Playground ahead, slow down',            false, 1),
       ('Pedestrian crossover ahead',             false, 2),
       ('Construction workers present',           false, 3)
     ) as c(label, is_correct, order_index);

-- Question 8 (signs, index 7) ─────────────────────────────────────────────────
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, 'signs',
         'What does a fluorescent yellow-green sign showing a person walking with parallel lines below mean?',
         'This is the pedestrian crossover sign. Drivers must yield to any pedestrian who has stepped onto the crossover — it is a legal requirement in Ontario.',
         'Pedestrian crossover — yield',
         'A fluorescent yellow-green sign with a walking figure and parallel lines marks a pedestrian crossover. Drivers must yield to pedestrians who are on or entering the crossover.',
         7
  from modules where slug = 'g1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Pedestrian crossover — yield to pedestrians',  true,  0),
       ('School zone ahead',                            false, 1),
       ('Bicycle lane crossing',                        false, 2),
       ('Playground zone with crosswalk',               false, 3)
     ) as c(label, is_correct, order_index);

-- Question 9 (signs, index 8) ─────────────────────────────────────────────────
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, 'signs',
         'What does a round yellow sign with a large X and two R''s mean?',
         'This is the railway crossing advance warning sign. Slow down, look and listen for trains, and be prepared to stop.',
         'Railway crossing ahead',
         'A round yellow sign with a large X and the letters "RR" is an advance warning of a railway crossing. You must slow down, look both ways for trains, and be ready to stop if a train is approaching.',
         8
  from modules where slug = 'g1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Railway crossing ahead — slow down and look for trains',   true,  0),
       ('Road narrows to one lane ahead',                           false, 1),
       ('No passing zone begins',                                   false, 2),
       ('Intersection ahead',                                       false, 3)
     ) as c(label, is_correct, order_index);

-- Question 10 (signs, index 9) ────────────────────────────────────────────────
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, 'signs',
         'What does an orange rectangular sign with black text or symbols typically indicate?',
         'Orange is the standard colour for temporary construction and road-work signs in Ontario. Always obey posted construction zone speeds — fines are doubled.',
         'Construction zone ahead',
         'Orange rectangular signs with black markings indicate a construction or road-work zone. Drivers must slow to the posted construction speed and follow any directions from flaggers or signs.',
         9
  from modules where slug = 'g1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Construction or road-work zone ahead',   true,  0),
       ('Detour route in effect',                 false, 1),
       ('Hazardous materials route',              false, 2),
       ('School crossing zone',                   false, 3)
     ) as c(label, is_correct, order_index);

-- Question 11 (signs, index 10) ───────────────────────────────────────────────
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, 'signs',
         'What does a yellow diamond-shaped sign showing a car with wavy lines beneath it mean?',
         'Wavy lines under a vehicle represent a slippery surface. This sign warns that the road becomes slippery when wet and you should reduce speed accordingly.',
         'Slippery when wet',
         'A yellow diamond sign showing a skidding car warns that the road surface is slippery when wet. Drivers should reduce speed and increase following distance in wet conditions.',
         10
  from modules where slug = 'g1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Slippery road — reduce speed in wet conditions',  true,  0),
       ('Rough road ahead',                               false, 1),
       ('Winding road ahead',                             false, 2),
       ('Flooding possible on this road',                 false, 3)
     ) as c(label, is_correct, order_index);

-- Question 12 (signs, index 11) ───────────────────────────────────────────────
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, 'signs',
         'What does a yellow diamond-shaped sign showing the silhouette of a deer mean?',
         'This warning sign alerts drivers that deer or other wildlife frequently cross the road in that area. Slow down and be ready to brake, especially at dawn and dusk.',
         'Wildlife crossing area',
         'A yellow diamond sign with a deer silhouette warns of a wildlife crossing area. Drivers should reduce speed and be alert for animals on or near the road, particularly at dawn and dusk.',
         11
  from modules where slug = 'g1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Wildlife crossing — watch for animals',          true,  0),
       ('Hunting area — watch for hunters',               false, 1),
       ('Farm vehicles may be on the road',               false, 2),
       ('Nature reserve — no stopping',                   false, 3)
     ) as c(label, is_correct, order_index);

-- Question 13 (signs, index 12) ───────────────────────────────────────────────
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, 'signs',
         'What does a yellow warning sign showing two arrows merging from either side onto a single line mean?',
         'This sign marks where a divided highway begins — the road ahead is separated by a median or barrier, and traffic flows in opposite directions on different roadways.',
         'Divided highway begins',
         'A sign showing two arrows merging to a single central line warns that a divided highway begins ahead. Keep right of the median or barrier that separates opposing traffic.',
         12
  from modules where slug = 'g1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Divided highway begins — keep right of median',  true,  0),
       ('Two-way traffic begins ahead',                  false, 1),
       ('Road merges from both sides',                   false, 2),
       ('Divided highway ends ahead',                    false, 3)
     ) as c(label, is_correct, order_index);

-- Question 14 (signs, index 13) ───────────────────────────────────────────────
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, 'signs',
         'What does a yellow warning sign showing a single line splitting into two arrows pointing away from each other mean?',
         'This is the "Divided Highway Ends" sign. The median or barrier disappears and you will be sharing the road with oncoming traffic — stay alert and keep right.',
         'Divided highway ends',
         'A sign showing one line splitting into two diverging arrows warns that the divided highway ends. Oncoming traffic will now share the undivided road, so drivers must keep right and increase alertness.',
         13
  from modules where slug = 'g1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Divided highway ends — oncoming traffic ahead',  true,  0),
       ('Divided highway begins ahead',                  false, 1),
       ('Road splits into two separate routes',          false, 2),
       ('Keep right — passing lane ends',                false, 3)
     ) as c(label, is_correct, order_index);

-- Question 15 (signs, index 14) ───────────────────────────────────────────────
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, 'signs',
         'What does a yellow warning sign showing two parallel lines that merge into one on the right mean?',
         'This sign indicates that the left lane ends ahead and traffic in that lane must merge right. Check mirrors, signal, and merge safely before the lane disappears.',
         'Lane ends — merge right',
         'A sign showing two parallel lines merging into one warns that a lane ends ahead. Drivers in the ending lane must yield and merge into the continuing lane safely.',
         14
  from modules where slug = 'g1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Lane ends ahead — merge into the continuing lane',  true,  0),
       ('Divided highway begins',                            false, 1),
       ('Road narrows to one lane from the right',          false, 2),
       ('Passing zone ends',                                 false, 3)
     ) as c(label, is_correct, order_index);

-- Question 16 (signs, index 15) ───────────────────────────────────────────────
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, 'signs',
         'What does a yellow warning sign showing two arrows pointing in opposite directions (up and down) mean?',
         'Two opposing arrows warn that the road ahead carries traffic in both directions on the same roadway. Stay in your lane and watch for oncoming vehicles.',
         'Two-way traffic ahead',
         'A yellow sign with two arrows pointing in opposite directions warns that the road ahead has two-way traffic. Drivers should stay right, watch for oncoming vehicles, and reduce speed if needed.',
         15
  from modules where slug = 'g1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Two-way traffic ahead',                          true,  0),
       ('Divided highway ends',                           false, 1),
       ('Passing permitted in both directions',           false, 2),
       ('Merge lane on both sides of the road',          false, 3)
     ) as c(label, is_correct, order_index);

-- Question 17 (signs, index 16) ───────────────────────────────────────────────
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, 'signs',
         'What does a yellow diamond-shaped sign showing a traffic light mean?',
         'This advance warning sign alerts you that a traffic signal is ahead. Reduce speed and be ready to stop in case the light changes.',
         'Traffic signal ahead',
         'A yellow diamond sign with a traffic-light symbol warns of a traffic signal ahead. Drivers should reduce speed and prepare to stop if the light is or turns red.',
         16
  from modules where slug = 'g1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Traffic signal ahead — be ready to stop',        true,  0),
       ('Railway crossing ahead',                         false, 1),
       ('Pedestrian crossover ahead',                     false, 2),
       ('Intersection controlled by yield signs',         false, 3)
     ) as c(label, is_correct, order_index);

-- Question 18 (signs, index 17) ───────────────────────────────────────────────
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, 'signs',
         'What does a blue square sign with a white "H" mean?',
         'Blue signs with an "H" indicate a hospital. Drivers must be especially careful near hospitals — do not use horns unnecessarily and observe posted speed limits.',
         'Hospital nearby',
         'A blue sign with a white "H" marks the direction to a hospital. Drivers should follow the sign if emergency medical care is needed and exercise caution near the facility.',
         17
  from modules where slug = 'g1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Hospital located in that direction',             true,  0),
       ('Hazardous materials route',                      false, 1),
       ('Highway interchange ahead',                      false, 2),
       ('Helicopter landing zone nearby',                 false, 3)
     ) as c(label, is_correct, order_index);

-- Question 19 (signs, index 18) ───────────────────────────────────────────────
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, 'signs',
         'What is the difference between a red-and-white "No Stopping" sign and a blue-and-white "No Parking" sign?',
         'No Stopping means you cannot stop at all — not even momentarily. No Parking means you may stop briefly to drop off or pick up passengers but cannot leave your vehicle unattended.',
         'No Stopping = no stop at all; No Parking = brief stop OK',
         'A red-and-white "No Stopping" sign means you cannot stop your vehicle there under any circumstances. A blue-and-white "No Parking" sign means you may stop briefly to load or unload passengers but cannot park (leave the vehicle unattended).',
         18
  from modules where slug = 'g1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('No Stopping = cannot stop at all; No Parking = brief stop to drop off is allowed',          true,  0),
       ('They mean the same thing — parking and stopping are both prohibited',                        false, 1),
       ('No Parking = cannot stop at all; No Stopping = brief drop-off is allowed',                  false, 2),
       ('No Stopping applies only at night; No Parking applies during posted daytime hours',          false, 3)
     ) as c(label, is_correct, order_index);

-- Question 20 (signs, index 19) ───────────────────────────────────────────────
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, 'signs',
         'What does a yellow diamond-shaped sign with an X inside a circle mean?',
         'This is the "Hidden Intersection" or "Concealed Intersection" warning sign. It alerts you that a cross-road ahead may not be easily visible — reduce speed and be ready to yield.',
         'Hidden intersection ahead',
         'A yellow diamond sign with an X inside a circle warns of a hidden or concealed intersection ahead. Drivers should reduce speed and watch carefully for vehicles entering from side roads that may not be visible.',
         19
  from modules where slug = 'g1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Hidden intersection ahead — reduce speed and watch for cross traffic',  true,  0),
       ('Railway crossing ahead',                                                false, 1),
       ('Four-way stop ahead',                                                   false, 2),
       ('Traffic circle ahead',                                                  false, 3)
     ) as c(label, is_correct, order_index);

-- ─────────────────────────────────────────────────── RULES (order_index 20–39)

-- Question 21 (rules, index 20) ───────────────────────────────────────────────
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, 'rules',
         'What is the maximum speed limit on most city streets in Ontario when no speed limit sign is posted?',
         'Unless a sign specifies otherwise, the default speed limit in urban areas in Ontario is 50 km/h.',
         '50 km/h',
         'The default maximum speed limit on most city and town streets in Ontario is 50 km/h when no other speed limit is posted.',
         20
  from modules where slug = 'g1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('50 km/h',   true,  0),
       ('40 km/h',   false, 1),
       ('60 km/h',   false, 2),
       ('70 km/h',   false, 3)
     ) as c(label, is_correct, order_index);

-- Question 22 (rules, index 21) ───────────────────────────────────────────────
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, 'rules',
         'What is the maximum speed limit on most Ontario highways when no speed limit sign is posted?',
         'The default speed limit on most provincial highways outside urban areas in Ontario is 80 km/h when no sign indicates a different limit.',
         '80 km/h',
         'The default maximum speed limit on most Ontario highways (outside urban areas) is 80 km/h when no speed limit sign is posted. Many 400-series highways have posted limits of 100 km/h.',
         21
  from modules where slug = 'g1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('80 km/h',   true,  0),
       ('90 km/h',   false, 1),
       ('100 km/h',  false, 2),
       ('70 km/h',   false, 3)
     ) as c(label, is_correct, order_index);

-- Question 23 (rules, index 22) ───────────────────────────────────────────────
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, 'rules',
         'What is the blood-alcohol concentration (BAC) above which a fully licensed Ontario driver faces criminal charges?',
         'In Ontario, a BAC of 0.05–0.079 triggers an administrative warn range (licence suspension, no criminal charge). At 0.08 or above, the driver faces criminal charges under the Criminal Code of Canada.',
         '0.08 (criminal limit)',
         'A fully licensed Ontario driver faces criminal charges under the Criminal Code of Canada when their blood-alcohol concentration is 0.08 or higher. Between 0.05 and 0.079, they face an administrative warn-range suspension — serious, but not a criminal charge.',
         22
  from modules where slug = 'g1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('0.08',  true,  0),
       ('0.05',  false, 1),
       ('0.10',  false, 2),
       ('0.06',  false, 3)
     ) as c(label, is_correct, order_index);

-- Question 24 (rules, index 23) ───────────────────────────────────────────────
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, 'rules',
         'At how many demerit points will a novice driver (G1 or G2 licence holder) face a licence suspension in Ontario?',
         'Novice (G1/G2) drivers face a suspension warning at 6 demerit points and an automatic licence suspension at 9 points — a lower threshold than fully licensed drivers (who are suspended at 15 points).',
         '9 demerit points',
         'A novice driver (G1 or G2) in Ontario faces an automatic licence suspension when they accumulate 9 demerit points. They receive a warning letter at 6 points.',
         23
  from modules where slug = 'g1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('9 demerit points',    true,  0),
       ('6 demerit points',    false, 1),
       ('12 demerit points',   false, 2),
       ('15 demerit points',   false, 3)
     ) as c(label, is_correct, order_index);

-- Question 25 (rules, index 24) ───────────────────────────────────────────────
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, 'rules',
         'What is the blood-alcohol rule for a driver holding a G1 licence in Ontario?',
         'G1 drivers are subject to a zero-tolerance alcohol policy. Any detectable blood-alcohol concentration while driving results in an immediate roadside suspension.',
         'Zero alcohol — 0.00 BAC',
         'A G1 licence holder in Ontario must have a blood-alcohol concentration of zero (0.00) when operating a motor vehicle. Any detectable amount of alcohol results in a roadside licence suspension.',
         24
  from modules where slug = 'g1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Zero — no alcohol permitted in blood (0.00 BAC)',   true,  0),
       ('Under 0.05 BAC is acceptable',                      false, 1),
       ('Under 0.08 BAC is acceptable',                      false, 2),
       ('The same limit as a fully licensed driver',         false, 3)
     ) as c(label, is_correct, order_index);

-- Question 26 (rules, index 25) ───────────────────────────────────────────────
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, 'rules',
         'What are the passenger and accompanying-driver requirements for a G1 licence holder in Ontario?',
         'A G1 driver must always be accompanied by a fully licensed driver (Class G or higher) who has at least four years of driving experience and sits in the front passenger seat.',
         'Fully licensed driver (4+ yrs) in front seat',
         'A G1 driver must be accompanied at all times by a fully licensed driver with at least four years of driving experience sitting in the front passenger seat. The number of passengers must not exceed the number of working seatbelts.',
         25
  from modules where slug = 'g1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Must be accompanied by a fully licensed driver with 4+ years of experience in the front seat',  true,  0),
       ('Must be accompanied by any licensed driver, who may sit in the back seat',                      false, 1),
       ('No accompanying driver required if driving during daylight hours',                              false, 2),
       ('Must be accompanied by a driving instructor only',                                              false, 3)
     ) as c(label, is_correct, order_index);

-- Question 27 (rules, index 26) ───────────────────────────────────────────────
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, 'rules',
         'During which hours is a G1 licence holder prohibited from driving in Ontario?',
         'G1 drivers are not permitted to drive between midnight and 5 a.m. This restriction is designed to keep new drivers off the road during the highest-risk overnight hours.',
         'Midnight to 5 a.m.',
         'A G1 driver in Ontario is prohibited from driving between midnight and 5:00 a.m. This nighttime restriction reduces exposure to higher-risk late-night driving conditions.',
         26
  from modules where slug = 'g1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Midnight to 5 a.m.',             true,  0),
       ('11 p.m. to 6 a.m.',             false, 1),
       ('10 p.m. to 5 a.m.',             false, 2),
       ('11 p.m. to 5 a.m.',             false, 3)
     ) as c(label, is_correct, order_index);

-- Question 28 (rules, index 27) ───────────────────────────────────────────────
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, 'rules',
         'Is a G1 driver permitted to drive on 400-series highways or other high-speed expressways in Ontario?',
         'G1 drivers are generally prohibited from driving on 400-series highways and high-speed expressways. The only exception is if a licensed driving instructor is present.',
         'Not permitted (except with driving instructor)',
         'A G1 driver is not permitted to drive on 400-series highways or designated high-speed expressways in Ontario, unless a licensed driving instructor is accompanying them and supervising.',
         27
  from modules where slug = 'g1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('No — prohibited unless accompanied by a licensed driving instructor',              true,  0),
       ('Yes — permitted at any time as long as the accompanying driver is licensed',       false, 1),
       ('Yes — permitted during daylight hours only',                                       false, 2),
       ('No — prohibited under all circumstances with no exceptions',                       false, 3)
     ) as c(label, is_correct, order_index);

-- Question 29 (rules, index 28) ───────────────────────────────────────────────
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, 'rules',
         'When must you switch from high beams to low beams while driving at night?',
         'High beams can blind other drivers. Ontario law requires you to switch to low beams within 150 m of an oncoming vehicle, and also when following another vehicle within 60 m.',
         'Within 150 m oncoming / 60 m following',
         'You must switch to low beams when you are within 150 metres of an oncoming vehicle or within 60 metres of a vehicle you are following. Using high beams at these distances can temporarily blind other drivers.',
         28
  from modules where slug = 'g1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Within 150 m of an oncoming vehicle or within 60 m of a vehicle ahead',   true,  0),
       ('Within 100 m of an oncoming vehicle or within 50 m of a vehicle ahead',   false, 1),
       ('Within 200 m of an oncoming vehicle or within 100 m of a vehicle ahead',  false, 2),
       ('Only when another driver flashes their lights at you',                     false, 3)
     ) as c(label, is_correct, order_index);

-- Question 30 (rules, index 29) ───────────────────────────────────────────────
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, 'rules',
         'When are you required to turn on your headlights in Ontario?',
         'Ontario''s Highway Traffic Act requires headlights to be on from one half-hour before sunset to one half-hour after sunrise, and at any time when visibility is poor.',
         '30 min before sunset to 30 min after sunrise',
         'In Ontario, headlights must be turned on from 30 minutes before sunset to 30 minutes after sunrise. They must also be used any time visibility is reduced due to weather or other conditions.',
         29
  from modules where slug = 'g1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('From 30 minutes before sunset to 30 minutes after sunrise, or in poor visibility',  true,  0),
       ('Only from sunset to sunrise exactly',                                               false, 1),
       ('Only when it is fully dark outside',                                                false, 2),
       ('Only when another driver signals that they cannot see you',                         false, 3)
     ) as c(label, is_correct, order_index);

-- Question 31 (rules, index 30) ───────────────────────────────────────────────
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, 'rules',
         'What is the recommended following distance behind another vehicle in normal driving conditions?',
         'The 2-second rule gives you enough space to react and stop safely. Pick a fixed object, and make sure at least 2 seconds pass from when the vehicle ahead passes it to when you do.',
         '2-second rule',
         'The recommended following distance in normal conditions is at least 2 seconds behind the vehicle ahead. This is measured using the 2-second rule — increase the gap in poor weather or when driving at higher speeds.',
         30
  from modules where slug = 'g1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('At least 2 seconds (2-second rule)',         true,  0),
       ('At least 1 second',                          false, 1),
       ('Exactly one car length for every 10 km/h',  false, 2),
       ('At least 5 seconds at all times',            false, 3)
     ) as c(label, is_correct, order_index);

-- Question 32 (rules, index 31) ───────────────────────────────────────────────
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, 'rules',
         'Is it legal to use a hand-held cell phone while driving in Ontario?',
         'Ontario law prohibits the use of hand-held electronic devices while driving. You may use a hands-free device (e.g., Bluetooth) but must never hold the phone.',
         'Prohibited — hands-free only',
         'Using a hand-held cell phone while driving is prohibited in Ontario. Drivers may only use a hands-free device. Violations result in demerit points, fines, and for novice drivers, a licence suspension.',
         31
  from modules where slug = 'g1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('No — hand-held use is prohibited; hands-free devices are permitted',          true,  0),
       ('Yes — if you keep both eyes on the road',                                     false, 1),
       ('Yes — but only when stopped at a red light',                                  false, 2),
       ('No — all cell phone use, including hands-free, is prohibited while driving',  false, 3)
     ) as c(label, is_correct, order_index);

-- Question 33 (rules, index 32) ───────────────────────────────────────────────
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, 'rules',
         'Who is legally required to wear a seatbelt in Ontario?',
         'Ontario''s seatbelt law requires the driver and every passenger to be buckled up. The driver is responsible for ensuring all passengers under 16 are properly restrained.',
         'Driver and every passenger',
         'In Ontario, the driver and every passenger in the vehicle must wear a properly fastened seatbelt. The driver is responsible for ensuring passengers under 16 years of age are buckled up.',
         32
  from modules where slug = 'g1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The driver and every passenger',                          true,  0),
       ('Only the driver and front-seat passenger',               false, 1),
       ('Only the driver',                                        false, 2),
       ('Only passengers under 18 years of age',                  false, 3)
     ) as c(label, is_correct, order_index);

-- Question 34 (rules, index 33) ───────────────────────────────────────────────
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, 'rules',
         'Up to what weight must a child be secured in an approved child car seat or booster seat in Ontario?',
         'Ontario requires an appropriate child restraint — infant seat, convertible seat, or booster — until the child weighs at least 36 kg (about 80 lbs). Height and age thresholds also apply.',
         'Under 36 kg requires child/booster seat',
         'In Ontario, children must be secured in an approved child car seat or booster seat until they reach at least 36 kg (approximately 80 lbs). The specific type of seat required depends on the child''s weight and size.',
         33
  from modules where slug = 'g1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Until the child reaches at least 36 kg',   true,  0),
       ('Until the child reaches at least 18 kg',   false, 1),
       ('Until the child is 5 years old',            false, 2),
       ('Until the child is 10 years old',           false, 3)
     ) as c(label, is_correct, order_index);

-- Question 35 (rules, index 34) ───────────────────────────────────────────────
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, 'rules',
         'At an uncontrolled intersection (no signs or signals), who has the right-of-way?',
         'At an uncontrolled intersection, you must yield to any vehicle that has already entered the intersection and to the vehicle on your right when you arrive at the same time.',
         'Yield to vehicle on the right',
         'At an uncontrolled intersection, drivers must yield to any vehicle that is already in the intersection, and when two vehicles arrive at the same time, the driver on the left must yield to the driver on the right.',
         34
  from modules where slug = 'g1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Yield to the vehicle on your right',                              true,  0),
       ('The vehicle travelling at the higher speed has the right-of-way', false, 1),
       ('Yield to the vehicle on your left',                               false, 2),
       ('The vehicle on the larger road always has the right-of-way',      false, 3)
     ) as c(label, is_correct, order_index);

-- Question 36 (rules, index 35) ───────────────────────────────────────────────
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, 'rules',
         'At a four-way stop, two vehicles arrive at the same time facing each other. Who goes first?',
         'When two vehicles arrive simultaneously at a four-way stop, the vehicle on the right has the right-of-way. If they are directly across from each other and both going straight, either may go, but caution is required.',
         'Vehicle on the right goes first',
         'When two vehicles arrive at a four-way stop at the same time, the driver on the left must yield to the driver on the right. The vehicle on the right has the right-of-way.',
         35
  from modules where slug = 'g1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The vehicle on the right has the right-of-way',                               true,  0),
       ('The vehicle on the left has the right-of-way',                                false, 1),
       ('The vehicle that arrived with more speed has the right-of-way',               false, 2),
       ('Both vehicles must wait until a third vehicle arrives to determine order',     false, 3)
     ) as c(label, is_correct, order_index);

-- Question 37 (rules, index 36) ───────────────────────────────────────────────
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, 'rules',
         'What must you do when approaching a stopped school bus with its upper red lights flashing on an undivided road?',
         'On an undivided road, traffic in BOTH directions must stop and remain stopped until the red lights stop flashing. Passing a stopped school bus is one of the most serious driving offences in Ontario.',
         'Stop — both directions must stop',
         'When a school bus is stopped with its upper red lights flashing on an undivided road, all traffic in both directions must stop and wait until the lights stop flashing and the bus moves. Passing a stopped school bus can result in heavy fines and demerit points.',
         36
  from modules where slug = 'g1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Stop — traffic in both directions must stop and wait',          true,  0),
       ('Slow to 20 km/h and proceed carefully',                         false, 1),
       ('Only traffic behind the bus must stop; oncoming traffic may proceed',  false, 2),
       ('Stop only if children are visible outside the bus',             false, 3)
     ) as c(label, is_correct, order_index);

-- Question 38 (rules, index 37) ───────────────────────────────────────────────
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, 'rules',
         'What must you do when an emergency vehicle (police, fire, or ambulance) is stopped on the shoulder with its lights flashing?',
         'Ontario''s "Move Over" law requires drivers to slow down to a safe speed and move to the next lane if it is safe to do so when passing any stopped emergency or road-maintenance vehicle with lights flashing.',
         'Slow down and move over one lane',
         'Under Ontario''s Move Over law, when passing an emergency or road-maintenance vehicle stopped on the shoulder with lights flashing, you must slow down to a safe speed and, if safe to do so, move into the next lane away from the stopped vehicle.',
         37
  from modules where slug = 'g1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Slow down and move into the next lane away from the vehicle if it is safe',  true,  0),
       ('Stop behind the emergency vehicle and wait for it to leave',                 false, 1),
       ('Maintain your speed but move as far right as possible',                      false, 2),
       ('Flash your headlights and proceed at normal speed',                          false, 3)
     ) as c(label, is_correct, order_index);

-- Question 39 (rules, index 38) ───────────────────────────────────────────────
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, 'rules',
         'What should you do when approaching an intersection where the traffic light has just turned yellow?',
         'A yellow light means the signal is about to turn red. You should stop if it is safe to do so. If you are too close to the intersection to stop safely, you may proceed with caution.',
         'Stop if safe; otherwise proceed with caution',
         'When approaching a yellow traffic light, you should stop if you can do so safely. If stopping would require sudden braking that could cause a collision, you may proceed through the intersection with caution before the light turns red.',
         38
  from modules where slug = 'g1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Stop if it is safe to do so; otherwise proceed with caution',    true,  0),
       ('Always speed up to clear the intersection before it turns red',  false, 1),
       ('Always stop immediately regardless of your position',            false, 2),
       ('Treat it the same as a green light and proceed normally',        false, 3)
     ) as c(label, is_correct, order_index);

-- Question 40 (rules, index 39) ───────────────────────────────────────────────
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, 'rules',
         'What should you do if you miss your exit while driving on an Ontario highway?',
         'Reversing or backing up on a highway is extremely dangerous and illegal. Always continue to the next exit and use it to turn around safely.',
         'Continue to next exit — never reverse',
         'If you miss your highway exit, you must continue driving to the next exit. It is illegal and extremely dangerous to reverse, back up, or make a U-turn on a highway. Use the next exit to turn around.',
         39
  from modules where slug = 'g1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Continue to the next exit — never reverse or back up on the highway',         true,  0),
       ('Carefully reverse along the shoulder back to the missed exit',                false, 1),
       ('Stop on the shoulder and wait for a safe gap to make a U-turn',              false, 2),
       ('Put on your hazard lights and slowly drive backward in the right-hand lane', false, 3)
     ) as c(label, is_correct, order_index);
