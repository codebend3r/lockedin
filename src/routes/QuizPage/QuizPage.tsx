import { useEffect } from "react";
import { useLocation } from "wouter";
import { useSessionStore } from "@/store/sessionStore";
import { completeSession, recordAnswer } from "@/lib/queries";
import { ProgressBar } from "@/components/ProgressBar";
import { MultipleChoice } from "@/modes/MultipleChoice/MultipleChoice";
import { Flashcards } from "@/modes/Flashcards/Flashcards";
import { Recap } from "@/modes/Recap/Recap";
import styles from "./QuizPage.module.css";

type Params = {
  slug: string;
};

export function QuizPage({ params }: { params: Params }) {
  const sessionId = useSessionStore((s) => s.sessionId);
  const mode = useSessionStore((s) => s.mode);
  const questions = useSessionStore((s) => s.questions);
  const currentIndex = useSessionStore((s) => s.currentIndex);
  const answers = useSessionStore((s) => s.answers);
  const record = useSessionStore((s) => s.recordAnswer);
  const advance = useSessionStore((s) => s.advance);
  const [, navigate] = useLocation();

  useEffect(() => {
    if (!sessionId || !mode || questions.length === 0) {
      navigate(`/m/${params.slug}`, { replace: true });
    }
  }, [sessionId, mode, questions.length, navigate, params.slug]);

  if (!sessionId || !mode || questions.length === 0) return null;
  if (currentIndex >= questions.length) return null;

  const question = questions[currentIndex];
  const total = questions.length;

  const finishIfDone = async (latestAnswers: typeof answers) => {
    if (latestAnswers.length !== total) return;
    const score = latestAnswers.filter((a) => a.isCorrect).length;
    await completeSession({ sessionId, score });
    navigate(`/m/${params.slug}/results/${sessionId}`, { replace: true });
  };

  const handleMc = async (payload: {
    choiceId: string;
    isCorrect: boolean;
  }) => {
    record({
      questionId: question.id,
      choiceId: payload.choiceId,
      selfGrade: null,
      isCorrect: payload.isCorrect,
    });
    await recordAnswer({
      sessionId,
      questionId: question.id,
      choiceId: payload.choiceId,
      selfGrade: null,
      isCorrect: payload.isCorrect,
    });
  };

  const handleSelfGrade = async (payload: {
    selfGrade: boolean;
    isCorrect: boolean;
  }) => {
    record({
      questionId: question.id,
      choiceId: null,
      selfGrade: payload.selfGrade,
      isCorrect: payload.isCorrect,
    });
    await recordAnswer({
      sessionId,
      questionId: question.id,
      choiceId: null,
      selfGrade: payload.selfGrade,
      isCorrect: payload.isCorrect,
    });
  };

  const handleNext = async () => {
    advance();
    // After advance, if we've now answered all questions, finish.
    const nextAnswers = useSessionStore.getState().answers;
    await finishIfDone(nextAnswers);
  };

  return (
    <div className={styles.page}>
      <div className={styles.top}>
        <span className={styles.counter}>
          Question {currentIndex + 1} of {total}
        </span>
        <ProgressBar current={currentIndex + (answers.length > currentIndex ? 1 : 0)} total={total} />
      </div>

      {mode === "multiple_choice" ? (
        <MultipleChoice
          question={question}
          onAnswer={handleMc}
          onNext={handleNext}
        />
      ) : mode === "flashcards" ? (
        <Flashcards
          question={question}
          onAnswer={handleSelfGrade}
          onNext={handleNext}
        />
      ) : (
        <Recap
          question={question}
          onAnswer={handleSelfGrade}
          onNext={handleNext}
        />
      )}
    </div>
  );
}
