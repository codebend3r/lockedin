import { useState } from "react";
import type { Question } from "@/lib/types";
import { Button } from "@/components/Button";
import { Markdown } from "@/components/Markdown";
import styles from "./Flashcards.module.css";

export type AnswerPayload = {
  selfGrade: boolean;
  isCorrect: boolean;
};

type Props = {
  question: Question;
  onAnswer: (payload: AnswerPayload) => Promise<void>;
  onNext: () => void;
};

export function Flashcards({ question, onAnswer, onNext }: Props) {
  const [flipped, setFlipped] = useState(false);
  const [graded, setGraded] = useState(false);

  const grade = async (gotIt: boolean) => {
    if (graded) return;
    setGraded(true);
    await onAnswer({ selfGrade: gotIt, isCorrect: gotIt });
  };

  const handleNext = () => {
    setFlipped(false);
    setGraded(false);
    onNext();
  };

  return (
    <div className={styles.wrap}>
      <button
        type="button"
        className={styles.card}
        onClick={() => setFlipped((f) => !f)}
        aria-pressed={flipped}
      >
        <div className={styles.face}>
          <span className={styles.faceLabel}>
            {flipped ? "Answer" : "Question"}
          </span>
          <span className={styles.faceText}>
            <Markdown inline>
              {flipped ? question.flashcard_back : question.prompt}
            </Markdown>
          </span>
        </div>
        <span className={styles.hint}>
          {flipped ? "Click to flip back" : "Click to reveal"}
        </span>
      </button>
      {flipped && !graded ? (
        <div className={styles.gradeRow}>
          <Button variant="danger" onClick={() => grade(false)}>
            Missed it
          </Button>
          <Button onClick={() => grade(true)}>Got it</Button>
        </div>
      ) : null}
      {graded ? (
        <Button onClick={handleNext} block>
          Next
        </Button>
      ) : null}
    </div>
  );
}
