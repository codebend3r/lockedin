import { useEffect, useMemo, useState } from "react";
import { Link, useLocation } from "wouter";
import { fetchModules } from "@/lib/queries";
import type { Mode, Module } from "@/lib/types";
import { useSessionStore } from "@/store/sessionStore";
import { Card } from "@/components/Card";
import { Button } from "@/components/Button";
import { ProgressBar } from "@/components/ProgressBar";
import styles from "@/routes/InProgressPage/InProgressPage.module.css";

const MODE_LABEL: Record<Mode, string> = {
  multiple_choice: "Multiple choice",
  flashcards: "Flashcards",
  recap: "Recap",
};

const dateFmt = new Intl.DateTimeFormat(undefined, {
  dateStyle: "medium",
  timeStyle: "short",
});

export function InProgressPage() {
  const [modules, setModules] = useState<Module[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [, navigate] = useLocation();

  const sessions = useSessionStore((s) => s.sessions);
  const discard = useSessionStore((s) => s.discard);

  useEffect(() => {
    const state = { alive: true };
    (async () => {
      try {
        const ms = await fetchModules();
        if (state.alive) setModules(ms);
      } catch (e) {
        if (state.alive)
          setError(e instanceof Error ? e.message : "Failed to load");
      } finally {
        if (state.alive) setLoading(false);
      }
    })();
    return () => {
      state.alive = false;
    };
  }, []);

  const items = useMemo(() => {
    const bySlug = new Map(modules.map((m) => [m.slug, m]));
    return Object.values(sessions)
      .filter((s) => s.answers.length < s.questions.length)
      .map((s) => ({ session: s, module: bySlug.get(s.slug) ?? null }))
      .filter(
        (p): p is { session: typeof p.session; module: Module } =>
          p.module !== null
      )
      .sort((a, b) => b.session.startedAt - a.session.startedAt);
  }, [sessions, modules]);

  if (loading) return <div className={styles.state}>Loading…</div>;
  if (error) return <div className={styles.state}>Error: {error}</div>;

  return (
    <div className={styles.page}>
      <h1 className={styles.heading}>In progress</h1>
      <p className={styles.subtitle}>
        Pick up where you left off. Discarded sessions stay on the server but
        disappear from this list.
      </p>

      {items.length === 0 ? (
        <Card className={styles.empty}>
          <p className={styles.emptyText}>
            Nothing in progress right now.{" "}
            <Link href="/">Start a new session</Link>.
          </p>
        </Card>
      ) : (
        <div className={styles.list}>
          {items.map(({ session, module }) => {
            const correct = session.answers.filter((a) => a.isCorrect).length;
            return (
              <Card key={session.slug} className={styles.item}>
                <div className={styles.itemHead}>
                  <span className={styles.badge} data-type={module.type}>
                    {module.type}
                  </span>
                  <span className={styles.mode}>
                    {MODE_LABEL[session.mode]}
                  </span>
                </div>
                <h2 className={styles.itemTitle}>{module.name}</h2>
                <div className={styles.progressRow}>
                  <ProgressBar
                    current={session.answers.length}
                    total={session.questions.length}
                  />
                  <span className={styles.progressLabel}>
                    {session.answers.length} of {session.questions.length}
                  </span>
                </div>
                <div className={styles.meta}>
                  <span>{correct} correct so far</span>
                  <span>·</span>
                  <span>Started {dateFmt.format(new Date(session.startedAt))}</span>
                </div>
                <div className={styles.actions}>
                  <Button variant="ghost" onClick={() => discard(session.slug)}>
                    Discard
                  </Button>
                  <Button onClick={() => navigate(`/m/${module.slug}/quiz`)}>
                    Resume
                  </Button>
                </div>
              </Card>
            );
          })}
        </div>
      )}
    </div>
  );
}
