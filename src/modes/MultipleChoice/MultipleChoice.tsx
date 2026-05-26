import { useMemo, useState } from "react";
import type { Question } from "../../lib/types";
import { shuffle } from "../../lib/sampling";
import { Button } from "../../components/Button";
import styles from "./MultipleChoice.module.css";

export interface AnswerPayload {
  choiceId: string;
  isCorrect: boolean;
}

interface Props {
  question: Question;
  onAnswer: (payload: AnswerPayload) => void;
  onNext: () => void;
}

export function MultipleChoice({ question, onAnswer, onNext }: Props) {
  const choices = useMemo(() => shuffle(question.choices), [question.id]);
  const [selectedId, setSelectedId] = useState<string | null>(null);

  const correctId = choices.find((c) => c.is_correct)?.id ?? null;
  const locked = selectedId !== null;

  const handlePick = (choiceId: string) => {
    if (locked) return;
    const isCorrect = choiceId === correctId;
    setSelectedId(choiceId);
    onAnswer({ choiceId, isCorrect });
  };

  const handleNext = () => {
    setSelectedId(null);
    onNext();
  };

  return (
    <div className={styles.wrap}>
      <h2 className={styles.prompt}>{question.prompt}</h2>
      <div className={styles.choices}>
        {choices.map((c) => {
          let cls = styles.choice;
          if (locked) {
            if (c.id === correctId) cls = styles.correct;
            else if (c.id === selectedId) cls = styles.incorrect;
            else cls = styles.dim;
          }
          return (
            <button
              key={c.id}
              type="button"
              className={cls}
              onClick={() => handlePick(c.id)}
              disabled={locked}
            >
              {c.label}
            </button>
          );
        })}
      </div>
      {locked && question.explanation ? (
        <div className={styles.explanation}>{question.explanation}</div>
      ) : null}
      {locked ? (
        <Button onClick={handleNext} block>
          Next
        </Button>
      ) : null}
    </div>
  );
}
