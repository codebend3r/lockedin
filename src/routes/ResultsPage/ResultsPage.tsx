import { useEffect, useState } from "react";
import { Link, useLocation } from "wouter";
import {
  fetchSessionWithAnswers,
  type SessionWithAnswers,
} from "@/lib/queries";
import { useSessionStore } from "@/store/sessionStore";
import { Card } from "@/components/Card";
import { Button } from "@/components/Button";
import { Markdown } from "@/components/Markdown";
import styles from "./ResultsPage.module.css";

type Params = {
  slug: string;
  id: string;
};

export function ResultsPage({ params }: { params: Params }) {
  const [data, setData] = useState<SessionWithAnswers | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const reset = useSessionStore((s) => s.reset);
  const [, navigate] = useLocation();

  useEffect(() => {
    let alive = true;
    (async () => {
      try {
        const d = await fetchSessionWithAnswers(params.id);
        if (!alive) return;
        setData(d);
      } catch (e) {
        if (!alive) return;
        setError(e instanceof Error ? e.message : "Failed to load");
      } finally {
        if (alive) setLoading(false);
      }
    })();
    return () => {
      alive = false;
    };
  }, [params.id]);

  if (loading) return <div className={styles.state}>Loading…</div>;
  if (error) return <div className={styles.state}>Error: {error}</div>;
  if (!data) return <div className={styles.state}>Session not found.</div>;

  const { session, answers, questions } = data;
  const questionById = new Map(questions.map((q) => [q.id, q]));
  const total = answers.length;
  const score = session.score ?? answers.filter((a) => a.is_correct).length;
  const pct = total === 0 ? 0 : Math.round((score / total) * 100);

  const tryAgain = () => {
    reset();
    navigate(`/m/${params.slug}`);
  };

  const goHome = () => {
    reset();
    navigate("/");
  };

  return (
    <div className={styles.page}>
      <Card className={styles.summary}>
        <div className={styles.scoreNum}>
          {score} / {total}
        </div>
        <div className={styles.pct}>{pct}% correct</div>
        <div className={styles.modeRow}>
          <span>Mode: {session.mode.replace("_", " ")}</span>
          {session.completed_at ? (
            <span>
              Finished {new Date(session.completed_at).toLocaleString()}
            </span>
          ) : null}
        </div>
        <div className={styles.actions}>
          <Button variant="secondary" onClick={goHome}>
            Back home
          </Button>
          <Button onClick={tryAgain}>Try again</Button>
        </div>
      </Card>

      <h2 className={styles.reviewHeading}>Review</h2>
      <div className={styles.list}>
        {answers.map((a, i) => {
          const q = questionById.get(a.question_id);
          if (!q) return null;
          const correctChoice = q.choices.find((c) => c.is_correct);
          const pickedChoice = a.choice_id
            ? q.choices.find((c) => c.id === a.choice_id)
            : null;
          return (
            <Card key={a.id} className={styles.item}>
              <div className={styles.itemHead}>
                <span className={styles.itemNum}>#{i + 1}</span>
                <span
                  className={a.is_correct ? styles.correct : styles.incorrect}
                >
                  {a.is_correct ? "Correct" : "Missed"}
                </span>
              </div>
              <div className={styles.itemPrompt}>
                <Markdown inline>{q.prompt}</Markdown>
              </div>
              {pickedChoice ? (
                <div className={styles.line}>
                  <strong>You picked:</strong> {pickedChoice.label}
                </div>
              ) : a.self_grade !== null ? (
                <div className={styles.line}>
                  <strong>Self-graded:</strong>{" "}
                  {a.self_grade ? "Got it" : "Missed it"}
                </div>
              ) : null}
              {correctChoice ? (
                <div className={styles.line}>
                  <strong>Correct:</strong> {correctChoice.label}
                </div>
              ) : null}
              <div className={styles.line}>
                <strong>Answer:</strong>{" "}
                <Markdown inline>{q.recap_answer}</Markdown>
              </div>
            </Card>
          );
        })}
      </div>

      <Link href="/" className={styles.back}>
        ← Back home
      </Link>
    </div>
  );
}
