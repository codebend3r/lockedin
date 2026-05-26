import { useState } from "react";
import type { Question } from "../../lib/types";
import { Button } from "../../components/Button";
import styles from "./Recap.module.css";

export interface AnswerPayload {
  selfGrade: boolean;
  isCorrect: boolean;
}

interface Props {
  question: Question;
  onAnswer: (payload: AnswerPayload) => void;
  onNext: () => void;
}

export function Recap({ question, onAnswer, onNext }: Props) {
  const [revealed, setRevealed] = useState(false);
  const [graded, setGraded] = useState(false);

  const grade = (gotIt: boolean) => {
    if (graded) return;
    setGraded(true);
    onAnswer({ selfGrade: gotIt, isCorrect: gotIt });
  };

  const handleNext = () => {
    setRevealed(false);
    setGraded(false);
    onNext();
  };

  return (
    <div className={styles.wrap}>
      <h2 className={styles.prompt}>{question.prompt}</h2>

      {!revealed ? (
        <Button onClick={() => setRevealed(true)} block>
          Reveal answer
        </Button>
      ) : (
        <div className={styles.answer}>
          <div className={styles.answerLabel}>Canonical answer</div>
          <div className={styles.answerText}>{question.recap_answer}</div>
        </div>
      )}

      {revealed && !graded ? (
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
