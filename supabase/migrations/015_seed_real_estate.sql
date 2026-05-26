-- 015_seed_real_estate.sql
-- Real Estate License module: 100 quiz questions

-- Question 0 (Agency: fiduciary duties acronym) -------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'The acronym OLDCAR is used to remember an agent''s fiduciary duties to their principal. What does the "L" stand for?',
         'OLDCAR stands for Obedience, Loyalty, Disclosure, Confidentiality, Accounting, and Reasonable care — the six classic fiduciary duties an agent owes to a principal.',
         'Loyalty (in OLDCAR)',
         'In the OLDCAR acronym, the "L" stands for Loyalty — the agent must place the principal''s interests above their own.',
         0
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Legality', false, 0),
       ('Loyalty', true, 1),
       ('Liability', false, 2),
       ('Leverage', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 1 (Agency: dual agency) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A licensee represents both the buyer and the seller in the same transaction. What is this relationship called, and what is required for it to be legal in states that permit it?',
         'Dual agency occurs when one licensee represents both parties to the same transaction. It is legal in some states only with the informed, written consent of both buyer and seller.',
         'Dual agency — informed written consent of both parties',
         'Dual agency is permitted in some states only when both the buyer and seller give informed written consent.',
         1
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Subagency, with broker approval only', false, 0),
       ('Designated agency, with no disclosure required', false, 1),
       ('Dual agency, with informed written consent of both parties', true, 2),
       ('Single agency, with verbal acknowledgment', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 2 (Agency: confidentiality survives termination) -------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A seller tells their listing agent in confidence that they will accept less than the list price. After the listing expires, the agent tells a buyer this information. Which fiduciary duty has been breached?',
         'The duty of confidentiality survives the termination of the agency relationship. An agent may never reveal a former principal''s confidential information unless required by law.',
         'Confidentiality (survives termination)',
         'The fiduciary duty of confidentiality survives termination of the agency relationship, so revealing a former client''s bottom-line price breaches it.',
         2
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Obedience', false, 0),
       ('Accounting', false, 1),
       ('Reasonable care', false, 2),
       ('Confidentiality', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 3 (Agency: material fact disclosure) -------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A listing agent discovers the basement floods every spring. The seller asks the agent to hide this from buyers. What must the agent do?',
         'Material facts about the physical condition of the property must be disclosed to all parties. The agent''s duty of obedience does not extend to illegal instructions, and concealing a known material defect is fraud.',
         'Disclose the material defect to buyers',
         'A licensee must always disclose known material defects affecting the property, even when the seller instructs otherwise.',
         3
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Disclose the flooding to prospective buyers', true, 0),
       ('Follow the seller''s instructions under the duty of obedience', false, 1),
       ('Disclose it only if a buyer specifically asks about flooding', false, 2),
       ('Refer the question to the buyer''s home inspector', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 4 (Agency: principal vs customer) ----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In an agency relationship, who is the "principal"?',
         'The principal is the party who has hired the agent and to whom the agent owes fiduciary duties. The other party in the transaction (not represented) is the "customer."',
         'Principal = the client who hires the agent',
         'The principal is the client who hires the agent and to whom fiduciary duties are owed; the unrepresented party is the customer.',
         4
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The cooperating broker', false, 0),
       ('The party who hires the agent and is owed fiduciary duties', true, 1),
       ('Any party the agent works with in the transaction', false, 2),
       ('The lender providing financing', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 5 (Agency: commingling) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A broker deposits a buyer''s earnest money check into the brokerage''s general operating account. What violation has occurred?',
         'Depositing client funds into the broker''s operating account is commingling, a violation of the duty of accounting and of state license law. Earnest money must be held in a separate escrow or trust account.',
         'Commingling of trust funds',
         'Mixing client trust funds with the broker''s own operating money is commingling, a license-law violation.',
         5
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Steering', false, 0),
       ('Novation', false, 1),
       ('Commingling', true, 2),
       ('Subrogation', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 6 (Agency: how created) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which of the following is NOT a recognized way an agency relationship can be created?',
         'Agency can be created by express agreement (oral or written), by implication from conduct, by ratification of an act after the fact, or by estoppel. Payment of compensation alone does not create agency — the agency is determined by the parties'' relationship, not by who pays.',
         'Compensation alone does not create agency',
         'Agency arises from express agreement, implication, ratification, or estoppel — not from who pays the commission.',
         6
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Express agreement', false, 0),
       ('Implication from conduct', false, 1),
       ('Estoppel', false, 2),
       ('The mere payment of a commission', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 7 (Agency: subagent) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Under traditional subagency in an MLS offer of cooperation, to whom does a cooperating broker owe fiduciary duties?',
         'In traditional subagency, the cooperating broker is a subagent of the seller (via the listing broker) and owes fiduciary duties to the seller, not the buyer they may be working with.',
         'Subagent owes duties to the seller',
         'A subagent under traditional MLS subagency owes fiduciary duties to the seller, not to the buyer they are showing homes to.',
         7
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The buyer they are working with', false, 0),
       ('The seller, through the listing broker', true, 1),
       ('Both the buyer and the seller equally', false, 2),
       ('Only their own employing broker', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 8 (Agency: termination by operation of law) ------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which of the following terminates an agency relationship by operation of law (i.e., automatically, without action by the parties)?',
         'Death or incompetence of either party, destruction of the property, and bankruptcy all terminate agency by operation of law. Mutual rescission terminates it by the acts of the parties.',
         'Death of principal/agent terminates agency by law',
         'Agency terminates automatically by operation of law upon death, incompetence, destruction of the property, or bankruptcy.',
         8
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Mutual rescission of the listing', false, 0),
       ('Death of the principal', true, 1),
       ('Cancellation by the agent', false, 2),
       ('Expiration of the listing term', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 9 (Agency: puffing vs misrepresentation) ---------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'An agent tells a buyer, "This is the most beautiful home in the neighborhood!" This statement is best characterized as:',
         'Puffing is non-actionable sales exaggeration of opinion ("beautiful," "best view"). Misrepresentation involves a false statement of material fact. Subjective superlatives without measurable claims are puffing.',
         'Puffing — opinion, not a statement of fact',
         'A subjective opinion or exaggerated sales statement is puffing, which is legally permissible — unlike misrepresentation of fact.',
         9
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Negligent misrepresentation', false, 0),
       ('Fraud', false, 1),
       ('Puffing', true, 2),
       ('A material misstatement', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 10 (Contracts: exclusive right to sell) ----------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Under an exclusive right-to-sell listing, when is the listing broker entitled to a commission?',
         'In an exclusive right-to-sell listing, the broker earns a commission no matter who procures the buyer during the listing period — including the seller. In an exclusive agency listing, the seller can sell to a buyer they found themselves without owing commission.',
         'Exclusive right-to-sell: broker paid no matter who finds the buyer',
         'Under an exclusive right-to-sell listing, the broker is owed a commission if the property sells during the listing period, regardless of who procured the buyer.',
         10
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Only if the broker personally procures the buyer', false, 0),
       ('Only if another MLS broker procures the buyer', false, 1),
       ('Whenever the property sells during the listing period, regardless of who finds the buyer', true, 2),
       ('Only if the seller does not find the buyer themselves', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 11 (Contracts: statute of frauds) ----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Under the Statute of Frauds, which real estate contract must generally be in writing to be enforceable?',
         'The Statute of Frauds requires that contracts for the sale of real estate, and most leases longer than one year, be in writing and signed by the party to be charged.',
         'Real estate sales contracts must be in writing',
         'The Statute of Frauds requires real estate sale contracts and most long-term leases to be in writing and signed to be enforceable.',
         11
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A contract for the sale of real property', true, 0),
       ('A month-to-month rental agreement', false, 1),
       ('A verbal agreement to mow a property''s lawn', false, 2),
       ('An open listing for under 30 days', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 12 (Contracts: option contract) ------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which best describes an option contract in real estate?',
         'An option is a unilateral contract: the optionor (seller) is obligated to sell at the agreed terms if the optionee chooses to exercise, but the optionee has no obligation to buy. Consideration is required to keep the option open.',
         'Unilateral: optionee may buy; optionor must sell if they do',
         'An option is a unilateral contract where the optionee has the right but not the obligation to buy, while the optionor must sell if the option is exercised.',
         12
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A bilateral contract obligating both parties to perform', false, 0),
       ('A unilateral contract giving the optionee the right but not the obligation to buy', true, 1),
       ('A listing agreement between seller and broker', false, 2),
       ('A loan instrument that pledges real estate as security', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 13 (Contracts: liquidated damages) ---------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A purchase agreement provides that if the buyer defaults, the seller may keep the earnest money as the seller''s sole remedy. This clause is best described as:',
         'A liquidated damages clause specifies in advance the amount a non-breaching party may recover if the other side defaults, in lieu of suing for actual damages. Earnest money forfeiture clauses are a common liquidated damages mechanism.',
         'Liquidated damages clause',
         'A clause limiting the seller''s remedy on buyer default to keeping the earnest money is a liquidated damages clause.',
         13
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A specific performance clause', false, 0),
       ('A novation clause', false, 1),
       ('A liquidated damages clause', true, 2),
       ('An indemnification clause', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 14 (Contracts: contingency) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A purchase agreement is subject to the buyer obtaining a mortgage within 30 days. This is an example of a:',
         'A contingency is a condition that must be satisfied for the contract to become binding/enforceable. Financing, inspection, and appraisal contingencies are typical examples.',
         'Contingency clause',
         'A condition that must be met for the contract to remain in force, such as financing approval, is called a contingency.',
         14
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Counteroffer', false, 0),
       ('Contingency', true, 1),
       ('Rescission', false, 2),
       ('Assignment', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 15 (Contracts: counteroffer) ---------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A seller responds to a buyer''s offer by changing the closing date. What is the legal effect on the original offer?',
         'Any change to the material terms of an offer is a counteroffer, which legally rejects and terminates the original offer. The buyer may now accept, reject, or counter the seller''s counteroffer.',
         'Counteroffer rejects the original offer',
         'A counteroffer legally rejects the original offer; the buyer is no longer able to accept the prior terms.',
         15
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The original offer remains open and can still be accepted', false, 0),
       ('The original offer is rejected and replaced by a counteroffer', true, 1),
       ('The original offer is binding; the change is merely a request', false, 2),
       ('The original offer is suspended until the buyer responds', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 16 (Contracts: void vs voidable) -----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A contract signed by a person who has been legally declared mentally incompetent is:',
         'Contracts signed by someone adjudicated mentally incompetent are void (no legal effect from the start). Contracts entered into by a minor or by someone temporarily impaired are typically voidable, not void.',
         'Void (no legal effect)',
         'A contract signed by a legally adjudicated incompetent person is void from the outset and has no legal effect.',
         16
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Void', true, 0),
       ('Voidable by the seller', false, 1),
       ('Enforceable so long as consideration was paid', false, 2),
       ('Valid but unenforceable', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 17 (Contracts: assignment) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A buyer assigns their rights under a purchase agreement to a new buyer. What is the effect on the original buyer''s liability if the contract is silent on assignment?',
         'Assignment transfers rights and duties, but unless the contract expressly releases the assignor, the assignor remains secondarily liable if the assignee fails to perform. Only novation fully substitutes a new party and releases the original.',
         'Assignor remains secondarily liable',
         'When a contract is assigned, the original party generally remains secondarily liable unless a novation releases them.',
         17
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The original buyer is completely released from all obligations', false, 0),
       ('The original buyer remains secondarily liable if the assignee defaults', true, 1),
       ('The contract is automatically void', false, 2),
       ('The seller can refuse the assignment for any reason', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 18 (Contracts: open listing) ---------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In an open listing, when is a broker entitled to a commission?',
         'In an open listing, the seller may engage multiple brokers, and only the broker who is the procuring cause of the sale earns a commission. The seller pays no commission if they find the buyer themselves.',
         'Open listing: only the procuring broker gets paid',
         'Under an open listing, only the broker who is the procuring cause of the sale earns a commission, and the seller pays no commission if they sell it themselves.',
         18
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Only if the broker is the procuring cause of the sale', true, 0),
       ('No matter who finds the buyer', false, 1),
       ('Only if the seller does not find the buyer', false, 2),
       ('Only if the buyer is procured through the MLS', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 19 (Contracts: parol evidence rule) --------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'After signing a fully integrated purchase contract, a buyer claims the seller verbally promised before signing that the refrigerator would be included. Which doctrine generally bars this evidence?',
         'The parol evidence rule generally bars introduction of prior oral or contemporaneous agreements that contradict, vary, or add to the terms of a fully integrated written contract.',
         'Parol evidence rule',
         'The parol evidence rule prevents prior or contemporaneous oral statements from contradicting a fully integrated written contract.',
         19
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Doctrine of equitable conversion', false, 0),
       ('Statute of limitations', false, 1),
       ('Parol evidence rule', true, 2),
       ('Doctrine of laches', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 20 (Property: real vs personal property) ---------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which of the following is generally classified as personal property (chattel) rather than real property?',
         'Real property includes land, anything permanently affixed to it (buildings, fixtures), and the bundle of rights that go with it. Movable, unattached items like furniture are personal property, also called chattel.',
         'Free-standing furniture = personal property',
         'Movable, unattached items such as free-standing furniture are personal property (chattel), not real property.',
         20
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A built-in dishwasher', false, 0),
       ('A chandelier hard-wired into the ceiling', false, 1),
       ('A free-standing refrigerator', true, 2),
       ('A fence permanently set in concrete footings', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 21 (Property: fixture test) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which factor is NOT part of the traditional MARIA test for determining whether an item has become a fixture?',
         'MARIA: Method of attachment, Adaptability to the property, Relationship of the parties, Intention, and Agreement of the parties. Market value of the item is not a factor.',
         'Market value is not a fixture-test factor',
         'The MARIA test (Method, Adaptability, Relationship, Intent, Agreement) determines fixture status — market value is not one of the factors.',
         21
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Method of attachment', false, 0),
       ('Adaptability of the item to the property', false, 1),
       ('Intent of the party who attached it', false, 2),
       ('Market value of the item', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 22 (Property: fee simple absolute) ---------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which estate represents the highest, most complete form of private ownership of real property?',
         'Fee simple absolute is the highest form of ownership, granting all the rights in the bundle, inheritable, and of indefinite duration. Other freehold estates (life estate, fee simple defeasible) are more limited.',
         'Fee simple absolute = highest ownership',
         'Fee simple absolute is the highest, most complete, and indefinite-duration form of real property ownership.',
         22
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Life estate', false, 0),
       ('Fee simple absolute', true, 1),
       ('Estate for years', false, 2),
       ('Fee simple determinable', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 23 (Property: life estate) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A grants property "to B for B''s life, then to C." What is C''s interest?',
         'B holds a life estate. C holds a remainder interest, which becomes possessory at B''s death. If the future interest went back to the grantor instead, it would be a reversion.',
         'C = remainderman',
         'When property goes "to B for life, then to C," C holds a remainder interest and is called the remainderman.',
         23
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Reversion', false, 0),
       ('Remainder', true, 1),
       ('Estate at sufferance', false, 2),
       ('Fee simple determinable', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 24 (Property: leasehold - estate for years) ------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A lease that runs from June 1, 2026, to May 31, 2027, with a fixed start and end date and no required notice to terminate, is best classified as:',
         'An estate for years is a leasehold with a definite beginning and ending date that terminates automatically without notice. The length need not literally be a year.',
         'Estate for years = definite term, no notice needed',
         'A leasehold with a fixed beginning and ending date that terminates automatically is an estate for years.',
         24
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Estate at sufferance', false, 0),
       ('Estate at will', false, 1),
       ('Estate for years', true, 2),
       ('Periodic estate', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 25 (Property: holdover tenant) -------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A tenant remains in possession after a one-year lease ends, without the landlord''s consent. The tenant now holds a(n):',
         'A holdover tenant who stays without permission has an estate at sufferance, the lowest form of leasehold. With the landlord''s continued acceptance of rent, this can convert to a periodic tenancy.',
         'Estate at sufferance = holdover without consent',
         'A holdover tenant who remains without consent has an estate at sufferance.',
         25
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Estate at sufferance', true, 0),
       ('Estate for years', false, 1),
       ('Periodic estate', false, 2),
       ('Estate at will', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 26 (Property: bundle of rights) ------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which of the following is NOT one of the rights traditionally included in the "bundle of rights" associated with real property ownership?',
         'The traditional bundle includes possession, control, enjoyment, exclusion, and disposition. The right to a profit on resale is not an inherent property right.',
         'No inherent right to profit on resale',
         'The bundle of rights includes possession, control, enjoyment, exclusion, and disposition — but not a guaranteed right to profit on resale.',
         26
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The right of possession', false, 0),
       ('The right of exclusion', false, 1),
       ('The right to a profit upon resale', true, 2),
       ('The right of disposition', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 27 (Property: trade fixtures) --------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A commercial tenant installs ovens, prep tables, and signage to run a bakery in leased space. At lease end, who generally owns these items?',
         'Items a commercial tenant attaches to leased space for use in the tenant''s trade or business are "trade fixtures" and remain the tenant''s personal property — they may be removed at lease end, provided any damage is repaired.',
         'Trade fixtures belong to the tenant',
         'Commercial trade fixtures remain the tenant''s personal property and may be removed at the end of the lease.',
         27
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The landlord, because they are now fixtures', false, 0),
       ('The tenant, as removable trade fixtures', true, 1),
       ('They become joint property of landlord and tenant', false, 2),
       ('The municipality, as part of commercial code requirements', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 28 (Property: emblements) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Annual crops cultivated by a tenant farmer are best described in real estate law as:',
         'Annual crops produced by a tenant''s labor are emblements, treated as the tenant''s personal property (not real property), even though they are attached to the land at the time of harvest.',
         'Emblements = tenant''s annual crops (personal property)',
         'Annual cultivated crops are emblements and are treated as the tenant''s personal property, not as part of the real estate.',
         28
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Fructus naturales (real property)', false, 0),
       ('Emblements (personal property)', true, 1),
       ('Trade fixtures', false, 2),
       ('Appurtenances', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 29 (Property: littoral vs riparian) --------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'An owner of land bordering an ocean or large lake holds water rights known as:',
         'Riparian rights apply to land bordering a flowing watercourse like a river or stream; littoral rights apply to land abutting a stationary body of water such as an ocean or large lake.',
         'Littoral rights = ocean/large lake; riparian = river',
         'Owners along oceans and large lakes have littoral rights, while owners along rivers and streams have riparian rights.',
         29
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Riparian rights', false, 0),
       ('Littoral rights', true, 1),
       ('Prior appropriation rights', false, 2),
       ('Subsurface rights', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 30 (Co-ownership: joint tenancy four unities) ----------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which of the following is NOT one of the four unities required to create a joint tenancy?',
         'A joint tenancy requires the four unities of Time, Title, Interest, and Possession (TTIP). Equity (i.e., equal financing) is not one of them — though equal shares of interest are.',
         'PITT: Possession, Interest, Time, Title',
         'A joint tenancy requires unity of Possession, Interest, Time, and Title — not unity of "equity."',
         30
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Time', false, 0),
       ('Title', false, 1),
       ('Equity', true, 2),
       ('Possession', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 31 (Co-ownership: right of survivorship) ---------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A and B own a property as joint tenants with right of survivorship. A dies, leaving a will giving everything to A''s son C. What happens to the property?',
         'In a joint tenancy with right of survivorship, the deceased joint tenant''s interest passes automatically to the surviving joint tenant(s) outside of probate — a will cannot override this.',
         'JTWROS overrides a will',
         'In a joint tenancy with right of survivorship, the survivor takes the deceased''s interest automatically, regardless of any will.',
         31
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('B and C each own a 50% share as tenants in common', false, 0),
       ('B owns the entire property by right of survivorship', true, 1),
       ('C inherits A''s half under A''s will', false, 2),
       ('The property must be sold and proceeds split', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 32 (Co-ownership: tenancy in common) -------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which statement about tenancy in common is correct?',
         'Tenants in common may hold unequal shares, can sell or devise their interest independently, and have no right of survivorship. Each cotenant has an undivided right to possess the whole.',
         'TIC: unequal shares allowed, no survivorship',
         'Tenants in common may own unequal shares, may transfer their interests freely, and have no right of survivorship.',
         32
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('All cotenants must own equal shares', false, 0),
       ('There is a right of survivorship between cotenants', false, 1),
       ('Cotenants may hold unequal shares and devise their interest by will', true, 2),
       ('Each cotenant owns only a physically divided portion of the property', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 33 (Co-ownership: tenancy by the entirety) -------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Tenancy by the entirety is a form of co-ownership available only to:',
         'Tenancy by the entirety is recognized only between legally married spouses (in jurisdictions that permit it). It includes the right of survivorship and limits unilateral conveyance.',
         'Tenancy by the entirety = married spouses only',
         'Tenancy by the entirety is a form of co-ownership reserved for legally married spouses in states that recognize it.',
         33
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Any two individuals taking title together', false, 0),
       ('Business partners in a real estate venture', false, 1),
       ('Legally married spouses', true, 2),
       ('Parents and their adult children', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 34 (Co-ownership: community property) ------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In a community property state, property acquired by either spouse during the marriage (except by gift or inheritance) is generally:',
         'Community property states treat assets acquired during marriage (other than gifts or inheritances to one spouse) as owned 50/50 by both spouses regardless of which spouse''s name is on the title.',
         'Community property = 50/50, acquired during marriage',
         'In community property states, assets acquired during marriage (except gifts/inheritance) are owned equally by both spouses.',
         34
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Considered separate property of whichever spouse earned it', false, 0),
       ('Owned 50/50 by both spouses as community property', true, 1),
       ('Held automatically in joint tenancy with right of survivorship', false, 2),
       ('Owned only by the spouse named on title', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 35 (Co-ownership: partition) ---------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Two tenants in common cannot agree on what to do with their jointly held property. What legal remedy is available to one cotenant who wants out?',
         'A partition action is a lawsuit allowing a cotenant to force either a physical division ("partition in kind") or, more commonly, a sale ("partition by sale") of co-owned property when cotenants cannot agree.',
         'Partition action',
         'A cotenant who cannot reach agreement may file a partition action to force division or sale of the co-owned property.',
         35
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Quiet title action', false, 0),
       ('Lis pendens', false, 1),
       ('Unlawful detainer', false, 2),
       ('Partition action', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 36 (Co-ownership: severance of JT) ---------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Three siblings own a property as joint tenants. One sibling sells their interest to an outsider. What is the result?',
         'A transfer by one joint tenant breaks the unity of time/title as to that interest. The buyer takes as a tenant in common, while the remaining two original joint tenants continue to hold their two-thirds in joint tenancy with each other.',
         'Sale severs JT as to that share',
         'When one joint tenant transfers their interest, the new owner becomes a tenant in common, while the remaining joint tenants continue in joint tenancy among themselves.',
         36
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The entire joint tenancy is destroyed and all become tenants in common', false, 0),
       ('The buyer becomes a tenant in common; the other two remain joint tenants with each other', true, 1),
       ('The sale is automatically void because joint tenants cannot transfer', false, 2),
       ('The buyer becomes a joint tenant with the other two siblings', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 37 (Co-ownership: condominium ownership) ---------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In a typical condominium, what does each unit owner hold title to?',
         'A condominium owner holds fee simple title to their individual unit plus an undivided interest as tenant in common in the common elements (hallways, grounds, amenities).',
         'Unit in fee + undivided share of common elements',
         'A condo owner has fee simple title to their unit and an undivided tenancy in common interest in the building''s common elements.',
         37
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Shares in a cooperative corporation that owns the building', false, 0),
       ('Fee simple to the unit plus an undivided share of the common elements', true, 1),
       ('A long-term lease for the unit only', false, 2),
       ('Fee simple to the entire building proportional to unit size', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 38 (Co-ownership: cooperative) -------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In a residential cooperative ("co-op"), the resident typically owns:',
         'In a co-op, the corporation owns the building. Residents own shares of the corporation and hold a proprietary lease entitling them to occupy a specific unit. They do not own real estate directly.',
         'Co-op: shares + proprietary lease',
         'Co-op residents own corporate shares and a proprietary lease for their unit, not real estate directly.',
         38
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Fee simple title to the unit', false, 0),
       ('A condominium interest in the unit', false, 1),
       ('Shares in the corporation plus a proprietary lease to the unit', true, 2),
       ('An easement in gross over the unit', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 39 (Co-ownership: severalty) ---------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'When a single individual or entity holds sole ownership of real property, the ownership is said to be held in:',
         'Despite the name, ownership "in severalty" means sole ownership by one person or legal entity, with no co-owners.',
         'Severalty = sole ownership',
         'Property held in severalty is owned by a single individual or entity, with no co-owners.',
         39
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Joint tenancy', false, 0),
       ('Tenancy in common', false, 1),
       ('Severalty', true, 2),
       ('Tenancy by the entirety', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 40 (Liens: general vs specific lien) -------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which of the following is a general lien rather than a specific lien?',
         'A judgment lien attaches to all of the debtor''s property within the jurisdiction (general lien). Mortgage, mechanic''s, and property tax liens attach to specific identified property.',
         'Judgment lien = general; mortgage/tax/mechanic = specific',
         'A judgment lien is a general lien attaching to all of a debtor''s property, while mortgage, property tax, and mechanic''s liens are specific to a particular property.',
         40
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Mortgage lien', false, 0),
       ('Mechanic''s lien', false, 1),
       ('Property tax lien', false, 2),
       ('Judgment lien', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 41 (Liens: priority of property tax lien) --------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In nearly all jurisdictions, which lien takes priority over all other liens regardless of when it was recorded?',
         'Real property tax and special assessment liens generally take priority over all other liens, including a previously recorded first mortgage. This is an exception to the "first to record" priority rule.',
         'Property tax liens have super-priority',
         'Real estate property tax and special assessment liens generally have priority over all other liens regardless of recording date.',
         41
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The first mortgage of record', false, 0),
       ('A federal tax lien (IRS)', false, 1),
       ('The real property tax lien', true, 2),
       ('The mechanic''s lien with the earliest work date', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 42 (Easements: appurtenant vs in gross) ----------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'An easement that benefits a specific parcel of land (the dominant estate) and burdens an adjoining parcel (the servient estate) is called:',
         'An easement appurtenant attaches to and runs with the land — it involves a dominant tenement (benefitted) and a servient tenement (burdened). An easement in gross benefits a person or entity (like a utility), not a parcel.',
         'Easement appurtenant = runs with the land',
         'An easement appurtenant benefits a dominant estate and burdens a servient estate, and it runs with the land when sold.',
         42
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Easement in gross', false, 0),
       ('Easement appurtenant', true, 1),
       ('License', false, 2),
       ('Profit à prendre', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 43 (Easements: prescription) ---------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'An easement created by long-term, open, notorious, continuous, and hostile use of another''s land is acquired by:',
         'An easement by prescription is acquired through use that is open, notorious, continuous, hostile (without permission), and lasts for the statutory period. It''s analogous to adverse possession but yields use, not title.',
         'Easement by prescription',
         'Open, notorious, continuous, hostile use of another''s land for the statutory period creates an easement by prescription.',
         43
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Easement by necessity', false, 0),
       ('Easement by grant', false, 1),
       ('Easement by prescription', true, 2),
       ('Easement by estoppel', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 44 (Encroachments) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A neighbor''s garage extends three feet over your property line. This unauthorized intrusion is called a(n):',
         'An encroachment is an unauthorized physical intrusion of an improvement (building, fence, driveway) onto another''s property. It is typically revealed by a survey.',
         'Encroachment = unauthorized physical intrusion',
         'An unauthorized physical intrusion of one owner''s improvement onto a neighbor''s property is called an encroachment.',
         44
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Easement', false, 0),
       ('Encroachment', true, 1),
       ('Lien', false, 2),
       ('Variance', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 45 (Deed restrictions / CCRs) --------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A subdivision''s recorded CCRs prohibit fences over 4 feet tall. These private restrictions are enforced by:',
         'Recorded CC&Rs (deed restrictions) are private agreements running with the land and are enforced by other affected lot owners or the HOA — not by local government. Zoning, by contrast, is enforced by the municipality.',
         'CCRs enforced privately by HOA/owners',
         'CC&Rs and deed restrictions are private and are enforced by neighboring lot owners or the HOA, not by the municipality.',
         45
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The local zoning board', false, 0),
       ('The state real estate commission', false, 1),
       ('Other lot owners or the HOA through private action', true, 2),
       ('The county recorder''s office', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 46 (Recording: race-notice/notice statutes) ------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'The primary purpose of recording a deed is to:',
         'Recording provides constructive notice to the world of the conveyance and protects the grantee''s priority against subsequent purchasers. Recording is not what transfers title — delivery and acceptance do.',
         'Recording = constructive notice / priority',
         'Recording a deed gives constructive notice to subsequent parties and establishes the grantee''s priority — it does not itself transfer title.',
         46
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Give constructive notice to subsequent purchasers and establish priority', true, 0),
       ('Transfer legal title to the grantee', false, 1),
       ('Pay required real estate transfer taxes', false, 2),
       ('Allow the lender to release the mortgage', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 47 (Title: general warranty deed) ----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which type of deed provides the greatest protection to the grantee?',
         'A general warranty deed includes all five customary covenants (seisin, right to convey, against encumbrances, quiet enjoyment, warranty forever) and warrants title against defects arising before AND during the grantor''s ownership.',
         'General warranty deed = most protection',
         'A general warranty deed offers the broadest protection, warranting title against all defects arising at any time, even before the grantor owned the property.',
         47
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Quitclaim deed', false, 0),
       ('Bargain and sale deed', false, 1),
       ('Special warranty deed', false, 2),
       ('General warranty deed', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 48 (Title: quitclaim deed) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A quitclaim deed:',
         'A quitclaim deed conveys whatever interest the grantor has (if any) with no warranties. It is commonly used to clear clouds on title — for example, releasing a possible interest.',
         'Quitclaim: no warranties; conveys whatever grantor has',
         'A quitclaim deed conveys whatever interest the grantor possesses with no warranties of title.',
         48
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Warrants title against all defects', false, 0),
       ('Conveys only whatever interest the grantor has, with no warranties', true, 1),
       ('Is used primarily for new construction sales', false, 2),
       ('Guarantees the property is free of encumbrances', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 49 (Title: cloud / quiet title) ------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A defect that may impair marketability of title and is revealed by a title search is best called a:',
         'A "cloud on title" is any claim, encumbrance, or apparent defect (such as an unreleased mortgage or possible heir''s interest) that, if valid, would impair marketability. A quiet title suit can remove a cloud.',
         'Cloud on title',
         'Any unresolved claim or apparent defect that could impair marketability of title is called a cloud on title.',
         49
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Cloud on title', true, 0),
       ('Estoppel certificate', false, 1),
       ('Lis pendens', false, 2),
       ('Reconveyance', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 50 (Financing: deed of trust parties) ------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In a deed of trust financing arrangement, who are the three parties?',
         'A deed of trust involves three parties: the trustor (borrower), beneficiary (lender), and trustee (neutral third party holding bare legal title). A mortgage, by contrast, involves only two: mortgagor and mortgagee.',
         'Deed of trust: trustor, trustee, beneficiary',
         'A deed of trust uses three parties — trustor (borrower), trustee (neutral), and beneficiary (lender).',
         50
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Mortgagor, mortgagee, and trustee', false, 0),
       ('Trustor (borrower), trustee, and beneficiary (lender)', true, 1),
       ('Grantor, grantee, and beneficiary', false, 2),
       ('Borrower, escrow agent, and title insurer', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 51 (Financing: discount points) ------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'One discount point on a mortgage loan is equal to:',
         'One point equals 1% of the loan amount, paid upfront to the lender, typically in exchange for a reduced interest rate (a "buy-down").',
         '1 point = 1% of the loan',
         'One discount point equals one percent of the loan amount and is generally paid to buy down the interest rate.',
         51
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('1% of the property''s sales price', false, 0),
       ('1% of the loan amount', true, 1),
       ('1% of the down payment', false, 2),
       ('A flat $1,000 fee', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 52 (Financing: PITI) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'The acronym PITI represents the four components of a typical monthly mortgage payment. What does the second "I" stand for?',
         'PITI = Principal, Interest, Taxes, and Insurance. The taxes and insurance components are typically collected into an escrow/impound account and paid by the lender as those bills come due.',
         'PITI: Principal, Interest, Taxes, Insurance',
         'In PITI, the second "I" stands for Insurance — the four components are Principal, Interest, Taxes, and Insurance.',
         52
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Investment', false, 0),
       ('Income', false, 1),
       ('Interest (a second time)', false, 2),
       ('Insurance', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 53 (Financing: FHA loans) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which statement about FHA loans is most accurate?',
         'The Federal Housing Administration insures loans made by approved lenders; it does not lend money directly. FHA loans require the borrower to pay both an upfront and an annual Mortgage Insurance Premium (MIP).',
         'FHA insures loans; requires MIP',
         'The FHA insures loans made by approved lenders and requires the borrower to pay Mortgage Insurance Premiums — it does not lend directly.',
         53
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The FHA lends money directly to qualified borrowers', false, 0),
       ('FHA loans require no insurance of any kind', false, 1),
       ('The FHA insures loans made by approved lenders and requires MIP', true, 2),
       ('FHA loans are limited to first-time homebuyers only', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 54 (Financing: VA loans) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A distinctive feature of a VA-guaranteed home loan for eligible veterans is that it:',
         'VA loans, available to eligible veterans, are guaranteed (not insured) by the Department of Veterans Affairs and frequently allow 0% down payment, no monthly private mortgage insurance, and a one-time funding fee.',
         'VA: 0% down possible, no monthly MI',
         'VA loans are guaranteed for eligible veterans and frequently allow 0% down with no monthly mortgage insurance.',
         54
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Requires the VA to act as the direct lender', false, 0),
       ('Requires a minimum 20% down payment', false, 1),
       ('Frequently allows 0% down payment with no monthly mortgage insurance', true, 2),
       ('Requires the property to be a second home or investment', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 55 (Financing: amortization) ---------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'On a fully amortizing fixed-rate mortgage, how does the breakdown of each scheduled payment change over time?',
         'In a fully amortized loan, payment amount is constant, but each payment''s allocation shifts: early payments are mostly interest, with principal increasing over time as the outstanding balance shrinks.',
         'Amortization: interest portion ↓, principal ↑ over time',
         'On a fully amortizing loan, the payment stays the same but the interest portion decreases and the principal portion increases over time.',
         55
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Interest portion stays constant; principal portion increases', false, 0),
       ('Principal portion stays constant; interest portion increases', false, 1),
       ('Interest portion decreases while principal portion increases', true, 2),
       ('Both interest and principal portions remain equal each month', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 56 (Financing: conventional / PMI) ---------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'On a conventional mortgage with a down payment below what threshold is the lender typically required to charge Private Mortgage Insurance (PMI)?',
         'Conventional lenders generally require PMI when the loan-to-value (LTV) ratio exceeds 80% — that is, when the borrower''s down payment is less than 20%. PMI may be canceled once equity reaches 22% under HPA.',
         'PMI required when LTV > 80% (down payment < 20%)',
         'Conventional loans typically require PMI when the down payment is less than 20% (LTV above 80%).',
         56
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('20% down payment', true, 0),
       ('10% down payment', false, 1),
       ('5% down payment', false, 2),
       ('3% down payment', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 57 (Financing: usury) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A loan that charges an interest rate exceeding the maximum allowed by state law is considered:',
         'Usury laws cap the maximum interest rate that may legally be charged. Loans exceeding the statutory cap are usurious and subject to penalties that vary by jurisdiction.',
         'Usury = above the legal interest cap',
         'A loan with an interest rate above the legally allowed maximum is usurious.',
         57
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A subprime loan', false, 0),
       ('A predatory but legal loan', false, 1),
       ('Usurious', true, 2),
       ('Conventional', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 58 (Financing: due-on-sale / alienation) ---------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A clause in a mortgage allowing the lender to call the entire balance due immediately if the property is sold is called a(n):',
         'A due-on-sale (alienation) clause lets the lender demand full repayment if title is transferred. It effectively prevents new buyers from "assuming" the loan unless the lender allows it.',
         'Due-on-sale (alienation) clause',
         'A due-on-sale or alienation clause lets the lender require full repayment when the property is sold or transferred.',
         58
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Prepayment penalty clause', false, 0),
       ('Defeasance clause', false, 1),
       ('Acceleration-on-default clause', false, 2),
       ('Due-on-sale (alienation) clause', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 59 (Financing: ARM index/margin) -----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'On an adjustable-rate mortgage (ARM), the interest rate at each adjustment is calculated as:',
         'An ARM''s new rate at each adjustment equals the current value of the chosen index (e.g., SOFR, Treasury) plus a fixed margin set by the lender, subject to caps.',
         'ARM rate = Index + Margin',
         'On an ARM, the new rate at adjustment equals the index plus the lender''s fixed margin, subject to any caps.',
         59
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Margin minus index', false, 0),
       ('Index plus margin', true, 1),
       ('Prime rate only', false, 2),
       ('Originally disclosed teaser rate only', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 60 (Closing: RESPA scope) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'The Real Estate Settlement Procedures Act (RESPA) primarily applies to:',
         'RESPA applies to federally related mortgage loans on 1–4 family residential property. It requires settlement disclosures and prohibits kickbacks/referral fees for settlement services.',
         'RESPA: federally related residential 1–4 family loans',
         'RESPA governs federally related mortgage loans on 1–4 family residential property, requiring disclosures and banning kickbacks.',
         60
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Cash transactions on commercial property', false, 0),
       ('Federally related mortgage loans on 1–4 family residential property', true, 1),
       ('Bridge loans secured by raw land only', false, 2),
       ('Loans on agricultural property over 25 acres', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 61 (Closing: kickbacks under RESPA) --------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Under RESPA Section 8, which practice is strictly prohibited?',
         'RESPA Section 8 prohibits kickbacks, referral fees, and unearned fee-splitting between settlement service providers (lenders, title companies, appraisers, agents). Bona fide payments for services actually performed are allowed.',
         'No kickbacks/referral fees among settlement providers',
         'RESPA Section 8 prohibits kickbacks and unearned referral fees between settlement service providers.',
         61
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A title company paying a referral fee to a real estate agent', true, 0),
       ('A buyer''s broker receiving a commission from the listing brokerage', false, 1),
       ('A lender requiring an escrow account for taxes and insurance', false, 2),
       ('A title insurer charging the buyer for a lender''s policy', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 62 (Closing: Closing Disclosure / TRID) ----------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Under the TRID rules, the Closing Disclosure must be received by the borrower at least how many business days before consummation of a residential mortgage?',
         'TRID requires the lender to provide the Closing Disclosure to the borrower at least three business days before consummation, giving the borrower time to review terms and costs.',
         '3 business days before consummation',
         'Under TRID, the borrower must receive the Closing Disclosure at least three business days before consummation.',
         62
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('1 business day', false, 0),
       ('3 business days', true, 1),
       ('7 business days', false, 2),
       ('10 business days', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 63 (Closing: title insurance lender vs owner) ----------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which statement about title insurance is correct?',
         'A lender''s policy protects only the lender''s interest up to the loan balance. An owner''s policy is separate, optional in many states, and protects the buyer''s equity for as long as the buyer (or heirs) owns the property.',
         'Lender''s policy ≠ owner''s policy',
         'A lender''s title policy protects only the lender; the buyer needs a separate owner''s policy to protect their interest.',
         63
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A lender''s policy also protects the buyer''s equity', false, 0),
       ('Title insurance is purchased on a recurring annual premium basis', false, 1),
       ('A lender''s policy protects only the lender; the buyer needs a separate owner''s policy', true, 2),
       ('Title insurance covers future liens that arise after closing', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 64 (Closing: escrow) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'The role of the escrow agent in a real estate closing is best described as:',
         'The escrow agent is a neutral third party who holds funds and documents and disburses them only when all conditions of the escrow instructions are satisfied. The agent owes a duty of impartiality to both sides.',
         'Neutral third-party stakeholder',
         'The escrow agent is a neutral third party who holds funds/documents and disburses them only when contract conditions are met.',
         64
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Advocate for the buyer in the closing', false, 0),
       ('Advocate for the seller in the closing', false, 1),
       ('Neutral third-party stakeholder for both parties', true, 2),
       ('Underwriter of the loan funds', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 65 (Closing: prorations - taxes) -----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Property taxes for the year are typically prorated at closing so that:',
         'Taxes are prorated so that the seller pays their share for days owned and the buyer pays their share for days owned. The day of closing convention varies by contract/jurisdiction.',
         'Each pays only for the days they own the property',
         'At closing, property taxes are prorated so each party only pays for the days during the year they actually owned the property.',
         65
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The buyer pays the entire year''s taxes', false, 0),
       ('Each party pays only for the portion of the year they owned the property', true, 1),
       ('The seller always pays the entire year''s taxes', false, 2),
       ('The lender pays the entire year''s taxes', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 66 (Closing: debit and credit balances) ----------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'On a settlement statement, the buyer''s earnest money deposit is shown as:',
         'On the buyer''s side, earnest money is a credit — it reduces the cash they must bring to closing. The sales price appears as a debit to the buyer (and a credit to the seller).',
         'Earnest money = credit to buyer',
         'Earnest money already paid by the buyer is shown as a credit to the buyer on the settlement statement.',
         66
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A debit to the buyer', false, 0),
       ('A credit to the seller', false, 1),
       ('A credit to the buyer', true, 2),
       ('A debit to the seller', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 67 (Closing: deed delivery) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'For a deed to legally transfer title, it must be:',
         'A valid deed must be in writing, signed by the grantor, identify the parties and property, contain a granting clause and consideration recital, and — critically — be delivered to and accepted by the grantee during the grantor''s lifetime. Recording is not required to transfer title between the parties.',
         'Delivery & acceptance transfer title',
         'A deed transfers title only upon delivery to and acceptance by the grantee during the grantor''s lifetime — recording is not required.',
         67
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Delivered to and accepted by the grantee', true, 0),
       ('Recorded with the county recorder', false, 1),
       ('Notarized by the grantee', false, 2),
       ('Signed by both grantor and grantee', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 68 (Closing: equitable conversion) ---------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'After a binding purchase agreement is signed but before closing, the doctrine of equitable conversion treats the buyer as:',
         'Equitable conversion holds that, once an enforceable contract is executed, the buyer is treated in equity as the property''s owner and the seller is treated as holding bare legal title. This is why risk of loss can shift to the buyer absent a contrary clause.',
         'Equitable conversion: buyer = equitable owner',
         'Under equitable conversion, once a contract is signed the buyer becomes the equitable owner of the property even before closing.',
         68
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Having no interest in the property until closing', false, 0),
       ('The legal owner of the property', false, 1),
       ('The equitable owner of the property', true, 2),
       ('A mere tenant until possession is delivered', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 69 (Closing: pro-ration accrued vs prepaid) ------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A seller paid the full annual property tax bill in January. The home closes in July. On the settlement statement, the seller will be:',
         'A prepaid item benefits the buyer for the remaining unused portion. The seller already paid for the months after closing, so the buyer owes the seller back — it''s a credit to the seller and a debit to the buyer.',
         'Prepaid tax = credit seller, debit buyer',
         'When the seller has prepaid property taxes that cover periods after closing, the buyer reimburses the seller via a credit to the seller and a debit to the buyer.',
         69
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Debited; buyer credited', false, 0),
       ('Credited; buyer debited', true, 1),
       ('Debited; buyer debited', false, 2),
       ('Credited; buyer credited', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 70 (Fair housing: protected classes under federal FHA) -------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which of the following is NOT a protected class under the federal Fair Housing Act (as amended)?',
         'Federal Fair Housing Act protected classes: race, color, religion, sex (including sexual orientation/gender identity by HUD interpretation), national origin, familial status, and disability. Marital status is protected by many state laws but is NOT a federal FHA protected class.',
         'Marital status is NOT a federal FHA class',
         'The seven federal Fair Housing Act protected classes are race, color, religion, sex, national origin, familial status, and disability — marital status is not federally protected.',
         70
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Familial status', false, 0),
       ('Religion', false, 1),
       ('Marital status', true, 2),
       ('National origin', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 71 (Fair housing: Civil Rights Act 1866) ---------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'The Civil Rights Act of 1866 prohibits discrimination in real property based on:',
         'The Civil Rights Act of 1866 prohibits all racial discrimination in real and personal property transactions, with no exceptions. It was reaffirmed in Jones v. Alfred H. Mayer Co. (1968).',
         '1866 Act: race, no exceptions',
         'The Civil Rights Act of 1866 prohibits racial discrimination in all real property transactions, without exception.',
         71
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Race only, with no exceptions', true, 0),
       ('All seven federal protected classes', false, 1),
       ('Disability and familial status', false, 2),
       ('Race and color, but only in interstate transactions', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 72 (Fair housing: blockbusting) ------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A real estate agent tells homeowners in a neighborhood that property values will drop because members of a particular protected class are moving in, encouraging them to list quickly. This illegal practice is called:',
         'Blockbusting (also "panic peddling") is inducing owners to sell based on the prospect that protected-class members are entering the area. It is a federal Fair Housing Act violation.',
         'Blockbusting / panic peddling',
         'Inducing sales by representing that protected-class members are entering a neighborhood is illegal blockbusting under the Fair Housing Act.',
         72
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Steering', false, 0),
       ('Redlining', false, 1),
       ('Blockbusting', true, 2),
       ('Puffing', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 73 (Fair housing: steering) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'An agent only shows minority buyers homes in certain neighborhoods, even when the buyers ask about others. This is:',
         'Steering is the illegal practice of directing prospective buyers or renters toward or away from neighborhoods based on protected-class characteristics, limiting their housing choices.',
         'Steering',
         'Channeling buyers toward or away from areas based on a protected class is illegal steering.',
         73
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Redlining', false, 0),
       ('Blockbusting', false, 1),
       ('Steering', true, 2),
       ('Channeling (not unlawful)', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 74 (Fair housing: redlining) ---------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A lender refuses to make loans in a defined geographic area without regard to the qualifications of individual applicants in that area. This is:',
         'Redlining is the illegal practice of denying or limiting loans, insurance, or other services to specific geographic areas (often defined by demographic makeup) regardless of individual creditworthiness.',
         'Redlining',
         'Denying loans or services to a geographic area regardless of individual qualifications is illegal redlining.',
         74
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Redlining', true, 0),
       ('Steering', false, 1),
       ('Blockbusting', false, 2),
       ('Tying', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 75 (Fair housing: ADA - public accommodations) ---------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'The Americans with Disabilities Act (ADA) Title III primarily requires accessibility in:',
         'ADA Title III applies to "places of public accommodation" — commercial facilities open to the public (offices, restaurants, hotels, retail). Private residential housing is governed primarily by the Fair Housing Act, not the ADA.',
         'ADA Title III = commercial public accommodations',
         'The ADA''s Title III governs accessibility in commercial public accommodations; private residences are covered by the FHA, not the ADA.',
         75
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('All private single-family homes', false, 0),
       ('Owner-occupied duplexes', false, 1),
       ('Commercial places of public accommodation', true, 2),
       ('Vacation cabins on private land', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 76 (Fair housing: reasonable accommodation) ------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A tenant in a no-pets apartment building has a disability and requests permission to keep an assistance animal. The landlord must:',
         'A request for an assistance animal is a request for reasonable accommodation under the Fair Housing Act. Landlords must grant it (waiving "no pets" policies and pet fees) unless it imposes an undue burden or fundamental change.',
         'Allow assistance animal as reasonable accommodation',
         'Under the FHA, landlords must grant a reasonable accommodation request — such as allowing an assistance animal — even in a no-pets building.',
         76
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Deny the request because of the no-pets policy', false, 0),
       ('Grant the reasonable accommodation, waiving the no-pets policy and any pet fee', true, 1),
       ('Require the tenant to pay a non-refundable pet deposit', false, 2),
       ('Require the tenant to move to a building that allows pets', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 77 (Fair housing: familial status / 55+) ---------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A housing community may legally exclude families with children only if it qualifies as:',
         'The Housing for Older Persons Act (HOPA) exempts qualified senior housing — generally either all units occupied by persons 62+ or at least 80% of units having at least one person 55+ — from the FHA''s familial status protection.',
         '55+/62+ housing (HOPA) can exclude children',
         'Familial-status discrimination is permitted only in qualified housing for older persons (HOPA) — generally 62+ communities or 55+ communities meeting the 80% rule.',
         77
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A private golf community', false, 0),
       ('Housing for older persons under HOPA', true, 1),
       ('Any condominium with an HOA vote', false, 2),
       ('Any rental community larger than 50 units', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 78 (Fair housing: advertising) -------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which of the following statements in a property advertisement most clearly violates the federal Fair Housing Act?',
         'Indicating a preference, limitation, or discrimination based on a protected class in any advertisement is illegal. "Perfect for a Christian family" expresses a religious preference. Describing the property itself (e.g., "walk-in closet") is acceptable.',
         'Ad can''t express preference for protected class',
         'Ads that express a preference, limitation, or discrimination based on a protected class (e.g., religion) violate the federal Fair Housing Act.',
         78
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('"Walk-in closet in master bedroom"', false, 0),
       ('"Quiet cul-de-sac, near parks"', false, 1),
       ('"Perfect for a Christian family"', true, 2),
       ('"Two-car attached garage"', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 79 (Fair housing: Mrs. Murphy exemption) ---------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'The "Mrs. Murphy" exemption to the federal Fair Housing Act applies to:',
         'The "Mrs. Murphy" exemption applies to owner-occupied buildings of four or fewer units. Even when this exemption applies, the property still may not be advertised in a discriminatory way and is still subject to the Civil Rights Act of 1866 prohibition on race discrimination.',
         'Owner-occupied ≤ 4-unit building',
         'The Mrs. Murphy exemption covers owner-occupied buildings of four or fewer units; it never permits race discrimination or discriminatory advertising.',
         79
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Any rental property with a live-on-site manager', false, 0),
       ('Owner-occupied buildings of four or fewer units', true, 1),
       ('Large apartment complexes with 100+ units', false, 2),
       ('All single-family homes sold without a broker', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 80 (Valuation: sales comparison approach) --------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'For an owner-occupied single-family residence, the appraisal approach typically given the most weight is:',
         'For single-family homes, the sales comparison (market data) approach is most reliable because plentiful comparable sales are available. The cost approach is best for new/unique properties; the income approach is best for income-producing properties.',
         'SFR appraisals: sales comparison approach',
         'The sales comparison approach typically carries the most weight when appraising owner-occupied single-family homes.',
         80
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Income approach', false, 0),
       ('Gross rent multiplier approach', false, 1),
       ('Cost approach', false, 2),
       ('Sales comparison approach', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 81 (Valuation: cost approach use case) -----------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'The cost approach is most useful for appraising:',
         'The cost approach (land value + replacement cost of improvements - depreciation) is best for newer construction and special-purpose properties (churches, schools, libraries) where comparable sales are scarce.',
         'Cost approach: new or special-purpose property',
         'The cost approach is most useful for new construction and special-purpose properties (schools, libraries, churches) where comparable sales are limited.',
         81
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Older single-family homes in active neighborhoods', false, 0),
       ('Newly constructed or special-purpose properties', true, 1),
       ('Multi-tenant office buildings', false, 2),
       ('Vacant agricultural land', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 82 (Valuation: income approach / cap rate) -------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'An investment property has net operating income of $60,000 and an applicable capitalization rate of 8%. Using the income approach, its indicated value is:',
         'Income approach (direct capitalization): Value = NOI / Cap Rate. $60,000 / 0.08 = $750,000.',
         'Value = NOI / Cap Rate',
         'Under the income approach, value equals NOI divided by the cap rate; $60,000 / 0.08 = $750,000.',
         82
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('$480,000', false, 0),
       ('$600,000', false, 1),
       ('$750,000', true, 2),
       ('$960,000', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 83 (Valuation: CMA vs appraisal) -----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A Comparative Market Analysis (CMA) prepared by a real estate licensee:',
         'A CMA is an informal estimate of probable selling price prepared by a licensee to help set a listing price or guide an offer. It is not an appraisal — only licensed/certified appraisers may issue formal appraisals.',
         'CMA is not an appraisal',
         'A CMA is a licensee''s informal price opinion to guide listing/offer decisions and is not a formal appraisal.',
         83
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Is a formal appraisal that lenders may rely upon', false, 0),
       ('Must follow USPAP appraisal standards', false, 1),
       ('Is an informal price opinion, not a formal appraisal', true, 2),
       ('Must be performed by a state-certified appraiser', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 84 (Valuation: economic obsolescence) ------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A home loses value because a new highway is built next to it. This is an example of:',
         'External (economic) obsolescence is loss in value caused by forces outside the property — adjacent uses, market shifts, environmental factors. It is generally considered incurable.',
         'External (economic) obsolescence',
         'Loss in value caused by something off the property (such as a new noisy highway) is external (economic) obsolescence and is generally incurable.',
         84
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Physical deterioration', false, 0),
       ('Functional obsolescence', false, 1),
       ('External (economic) obsolescence', true, 2),
       ('Accrued depreciation reserve', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 85 (Valuation: functional obsolescence) ----------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A 1950s home has only one bathroom and no closets in the bedrooms. This loss in value relative to modern preferences is:',
         'Functional obsolescence is loss in value caused by outdated design, layout, or features within the property — old fixtures, awkward floor plans, insufficient closets/bathrooms.',
         'Functional obsolescence',
         'Outdated design or layout features within the property (insufficient bathrooms, no closets) cause functional obsolescence.',
         85
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('External obsolescence', false, 0),
       ('Functional obsolescence', true, 1),
       ('Physical deterioration', false, 2),
       ('Land value loss', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 86 (Valuation: principle of substitution) --------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'The appraisal principle stating that a buyer will pay no more for a property than the cost of acquiring an equally desirable substitute is:',
         'The principle of substitution underlies all three appraisal approaches: an informed buyer will pay no more than the cost of obtaining an equivalent substitute property of similar utility.',
         'Principle of substitution',
         'The principle of substitution holds that a buyer will pay no more than the cost of an equally desirable substitute, and it underlies all three appraisal approaches.',
         86
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Principle of conformity', false, 0),
       ('Principle of substitution', true, 1),
       ('Principle of progression', false, 2),
       ('Principle of anticipation', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 87 (Valuation: highest and best use) -------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         '"Highest and best use" of a property is the use that is:',
         'Highest and best use is the use that is legally permissible, physically possible, financially feasible, and maximally productive — yielding the greatest value to the land.',
         'Legal, possible, feasible, maximally productive',
         'Highest and best use is the legally permitted, physically possible, financially feasible, and maximally productive use of a property.',
         87
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Whatever use the current owner prefers', false, 0),
       ('The use that generates the most rental income only', false, 1),
       ('Legally permissible, physically possible, financially feasible, and maximally productive', true, 2),
       ('The use that costs the least to develop', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 88 (Valuation: progression/regression) -----------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A modest home located among much larger, more expensive homes is likely to be worth more than it would be elsewhere. This is the principle of:',
         'Progression: the value of a less-valuable property is enhanced by association with higher-value neighboring properties. Regression is the opposite — a high-value home loses value among lower-value neighbors.',
         'Progression: small home benefits from bigger neighbors',
         'Under the principle of progression, a modest home gains value from being among more expensive surrounding homes.',
         88
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Regression', false, 0),
       ('Progression', true, 1),
       ('Conformity', false, 2),
       ('Anticipation', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 89 (Valuation: GRM) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A property rents for $2,000 per month and comparable properties have a Gross Rent Multiplier (GRM) of 120 (using monthly rent). The estimated value using GRM is:',
         'Value = monthly rent × GRM (when GRM uses monthly rent). $2,000 × 120 = $240,000. GRM is a quick screening tool, not a substitute for full appraisal.',
         'Value = monthly rent × GRM',
         'With a monthly-rent GRM, value equals monthly rent times the GRM; $2,000 × 120 = $240,000.',
         89
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('$24,000', false, 0),
       ('$120,000', false, 1),
       ('$240,000', true, 2),
       ('$2,400,000', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 90 (License law: who needs a license) ------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which of the following individuals must generally hold an active real estate license to be compensated for their activity?',
         'Anyone who, for compensation, performs activities such as listing, selling, leasing, or negotiating real estate for others must be licensed. A homeowner selling their own property without compensation from another, an attorney acting in legal practice, and an executor under court order are typically exempt.',
         'Acting for others, for compensation → license',
         'A person who, for compensation, lists, sells, leases, or negotiates real estate for others must generally be licensed.',
         90
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A homeowner selling their own personal residence', false, 0),
       ('A person paid commission to find buyers for other people''s properties', true, 1),
       ('An attorney representing a client in the legal aspects of a closing', false, 2),
       ('A court-appointed executor selling property of the estate', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 91 (License law: salesperson supervision) --------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A real estate salesperson (associate licensee) may legally receive a commission only from:',
         'A salesperson works under the supervision of a sponsoring broker and may receive compensation only through their broker — never directly from a buyer, seller, or another brokerage.',
         'Salespersons paid only by their broker',
         'A salesperson may be compensated for real estate activity only through their sponsoring broker.',
         91
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The seller directly at closing', false, 0),
       ('The cooperating broker on the other side of the deal', false, 1),
       ('The buyer directly, if the buyer prefers', false, 2),
       ('Their sponsoring broker', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 92 (Antitrust: price fixing) ---------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Two competing brokerages meet for lunch and agree to set a uniform 6% commission. This is a per se violation of antitrust law known as:',
         'Price fixing — an agreement between competitors to set prices or commissions — is a per se violation of the Sherman Antitrust Act. Commission rates must always be negotiated individually between broker and client.',
         'Price fixing (per se Sherman Act violation)',
         'Competitors agreeing to a uniform commission is illegal price fixing — a per se Sherman Antitrust Act violation.',
         92
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Group boycott', false, 0),
       ('Tie-in arrangement', false, 1),
       ('Price fixing', true, 2),
       ('Market allocation', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 93 (Antitrust: market allocation) ----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Two competing brokerages agree that one will handle listings only on the north side of town and the other only on the south side. This is illegal:',
         'Market allocation — competitors dividing geographic territories, customers, or product lines — is a per se violation of antitrust law, just like price fixing.',
         'Market allocation (per se illegal)',
         'Competitors dividing markets by territory or customer type is illegal market allocation under federal antitrust law.',
         93
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Steering', false, 0),
       ('Market allocation', true, 1),
       ('Subagency', false, 2),
       ('Cooperation', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 94 (Antitrust: group boycott) --------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Several brokerages agree among themselves not to cooperate with a new discount brokerage. This is an antitrust violation called a(n):',
         'A group boycott is an agreement among competitors to refuse to deal with a particular firm — for example, to freeze out a discount brokerage. It is a per se antitrust violation.',
         'Group boycott',
         'Competing firms agreeing to refuse to deal with another firm is an illegal group boycott — a per se antitrust violation.',
         94
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Group boycott', true, 0),
       ('Tie-in arrangement', false, 1),
       ('Price fixing', false, 2),
       ('Defensive cooperation', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 95 (Ethics: NAR Code - honesty in ads) -----------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Under the NAR Code of Ethics and most state advertising rules, a real estate licensee''s advertisement of property must:',
         'Advertising must be truthful and may not mislead. The licensee''s identity and brokerage affiliation must be disclosed; "blind ads" (not disclosing licensee status) are prohibited.',
         'No blind ads — disclose status & brokerage',
         'Licensees may not place "blind ads"; advertising must be truthful and must disclose the licensee''s status and brokerage.',
         95
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Be truthful and disclose the licensee''s name and brokerage affiliation', true, 0),
       ('Be designed to look like an ad from a private owner (FSBO)', false, 1),
       ('Quote a sale price at least 10% above the listing price', false, 2),
       ('Include the seller''s contact information directly', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 96 (Escrow handling: commingling vs conversion) --------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A broker uses earnest money held in trust to pay the brokerage''s rent. This serious offense is best described as:',
         'Conversion is the unauthorized appropriation of client trust funds for the licensee''s own use, going beyond mere commingling. It is a major license law violation and often a crime.',
         'Conversion of trust funds',
         'Using client trust funds for the broker''s own purposes is conversion — a more serious violation than commingling and a basis for license revocation.',
         96
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Mere commingling', false, 0),
       ('Conversion', true, 1),
       ('A technical accounting error', false, 2),
       ('Subrogation', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 97 (License law: real estate commission) ---------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In every state, the state agency primarily responsible for licensing and regulating real estate licensees is generally called the:',
         'Each state has a Real Estate Commission (or Department/Division of Real Estate) that issues and renews licenses, adopts rules, investigates complaints, and imposes discipline. The NAR is a private trade association, not a regulator.',
         'State Real Estate Commission regulates licensees',
         'The state Real Estate Commission (or equivalent agency) licenses, regulates, and disciplines real estate licensees.',
         97
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('National Association of Realtors (NAR)', false, 0),
       ('Local Multiple Listing Service (MLS)', false, 1),
       ('State Real Estate Commission (or Department/Division of Real Estate)', true, 2),
       ('Federal Trade Commission (FTC)', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 98 (Ethics: NAR REALTOR designation) -------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Only a real estate licensee who is a member of which organization may use the trademarked term "REALTOR®"?',
         '"REALTOR®" is a federally registered trademark of the National Association of Realtors (NAR). Only NAR members who subscribe to its Code of Ethics may use the mark; non-member licensees may not.',
         'REALTOR® = NAR member only',
         'Only members of the National Association of Realtors who follow the NAR Code of Ethics may use the trademarked term "REALTOR®".',
         98
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Any state-licensed real estate licensee', false, 0),
       ('Members of the National Association of Realtors (NAR)', true, 1),
       ('Members of the local Multiple Listing Service', false, 2),
       ('Federally certified appraisers', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 99 (Advertising: Truth in Lending / Reg Z triggering terms) --------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Under Regulation Z (Truth in Lending), if a real estate advertisement states a specific "triggering term" such as the down payment amount or monthly payment, the ad must also disclose:',
         'When a Reg Z triggering term is used (down payment, payment amount, number of payments, finance charge, or term of repayment), the ad must also include the amount/percentage of the down payment, terms of repayment, and the Annual Percentage Rate (APR) — including any increases over the term.',
         'Triggering term ⇒ must disclose APR, down, repayment',
         'Reg Z requires that if an ad uses a triggering term, it must also disclose the down payment, repayment terms, and the APR.',
         99
  from modules where slug = 'real-estate'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Only the interest rate', false, 0),
       ('Down payment, repayment terms, and the APR', true, 1),
       ('The seller''s annual income', false, 2),
       ('The listing broker''s commission rate', false, 3)
     ) as c(label, is_correct, order_index);
