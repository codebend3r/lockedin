import { create } from "zustand";
import { persist } from "zustand/middleware";
import type { Mode, Question } from "@/lib/types";

export type RecordedAnswer = {
  questionId: string;
  choiceId: string | null;
  selfGrade: boolean | null;
  isCorrect: boolean;
};

type SessionState = {
  sessionId: string | null;
  moduleId: string | null;
  mode: Mode | null;
  questions: Question[];
  currentIndex: number;
  answers: RecordedAnswer[];
  startedAt: number | null;

  start: (args: {
    sessionId: string;
    moduleId: string;
    mode: Mode;
    questions: Question[];
  }) => void;

  recordAnswer: (answer: RecordedAnswer) => void;
  advance: () => void;
  setIndex: (n: number) => void;
  reset: () => void;
};

export const useSessionStore = create<SessionState>()(
  persist(
    (set) => ({
      sessionId: null,
      moduleId: null,
      mode: null,
      questions: [],
      currentIndex: 0,
      answers: [],
      startedAt: null,

      start: ({ sessionId, moduleId, mode, questions }) =>
        set({
          sessionId,
          moduleId,
          mode,
          questions,
          currentIndex: 0,
          answers: [],
          startedAt: Date.now(),
        }),

      recordAnswer: (answer) =>
        set((s) => ({ answers: [...s.answers, answer] })),

      advance: () =>
        set((s) => ({
          currentIndex: Math.min(s.currentIndex + 1, s.questions.length),
        })),

      setIndex: (n) => set({ currentIndex: n }),

      reset: () =>
        set({
          sessionId: null,
          moduleId: null,
          mode: null,
          questions: [],
          currentIndex: 0,
          answers: [],
          startedAt: null,
        }),
    }),
    { name: "lockedin-session-v1" }
  )
);
