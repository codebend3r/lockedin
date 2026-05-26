import { useEffect, useMemo, useState } from "react";
import { Link, useLocation } from "wouter";
import {
  fetchModules,
  fetchLastScoreByModule,
  type LastScore,
} from "@/lib/queries";
import type { Mode, Module } from "@/lib/types";
import { Card } from "@/components/Card";
import { Button } from "@/components/Button";
import { useSessionStore } from "@/store/sessionStore";
import styles from "@/routes/HomePage/HomePage.module.css";

const MODE_LABEL: Record<Mode, string> = {
  multiple_choice: "Multiple choice",
  flashcards: "Flashcards",
  recap: "Recap",
};

export function HomePage() {
  const [modules, setModules] = useState<Module[]>([]);
  const [lastScores, setLastScores] = useState<Record<string, LastScore>>({});
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [, navigate] = useLocation();

  const sessionId = useSessionStore((s) => s.sessionId);
  const sessionModuleId = useSessionStore((s) => s.moduleId);
  const sessionMode = useSessionStore((s) => s.mode);
  const totalQuestions = useSessionStore((s) => s.questions.length);
  const answeredCount = useSessionStore((s) => s.answers.length);
  const resetSession = useSessionStore((s) => s.reset);

  useEffect(() => {
    const state = { alive: true };
    (async () => {
      try {
        const [ms, ls] = await Promise.all([
          fetchModules(),
          fetchLastScoreByModule(),
        ]);
        if (!state.alive) return;
        setModules(ms);
        setLastScores(ls);
      } catch (e) {
        if (!state.alive) return;
        setError(e instanceof Error ? e.message : "Failed to load");
      } finally {
        if (state.alive) setLoading(false);
      }
    })();
    return () => {
      state.alive = false;
    };
  }, []);

  const activeModule = useMemo(() => {
    if (!sessionId || !sessionModuleId) return null;
    return modules.find((m) => m.id === sessionModuleId) ?? null;
  }, [modules, sessionId, sessionModuleId]);

  const showResume =
    activeModule &&
    sessionMode &&
    totalQuestions > 0 &&
    answeredCount < totalQuestions;

  if (loading) return <div className={styles.state}>Loading…</div>;
  if (error) return <div className={styles.state}>Error: {error}</div>;

  return (
    <div className={styles.page}>
      {showResume && activeModule && sessionMode ? (
        <Card className={styles.resume}>
          <div className={styles.resumeBody}>
            <div className={styles.resumeLabel}>In progress</div>
            <h2 className={styles.resumeTitle}>{activeModule.name}</h2>
            <p className={styles.resumeMeta}>
              {answeredCount} of {totalQuestions} answered ·{" "}
              {MODE_LABEL[sessionMode]}
            </p>
          </div>
          <div className={styles.resumeActions}>
            <Button variant="ghost" onClick={() => resetSession()}>
              Discard
            </Button>
            <Button
              onClick={() => navigate(`/m/${activeModule.slug}/quiz`)}
            >
              Resume
            </Button>
          </div>
        </Card>
      ) : null}
      <h1 className={styles.heading}>What are we locking in today?</h1>
      <div className={styles.grid}>
        {modules.map((m) => {
          const last = lastScores[m.id];
          return (
            <Link key={m.id} href={`/m/${m.slug}`} className={styles.cardLink}>
              <Card className={styles.card}>
                <div className={styles.badgeRow}>
                  <span className={styles.badge} data-type={m.type}>
                    {m.type}
                  </span>
                  <span className={styles.count}>
                    {m.total_questions} questions
                  </span>
                </div>
                <h2 className={styles.name}>{m.name}</h2>
                <p className={styles.desc}>{m.description}</p>
                {last ? (
                  <div className={styles.last}>
                    Last score: {last.score} / {last.sessionSize}
                  </div>
                ) : (
                  <div className={styles.last}>Not yet attempted</div>
                )}
              </Card>
            </Link>
          );
        })}
      </div>
    </div>
  );
}
