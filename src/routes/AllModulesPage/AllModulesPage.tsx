import { useEffect, useState } from "react";
import { Link } from "wouter";
import {
  fetchModules,
  fetchLastScoreByModule,
  type LastScore,
} from "@/lib/queries";
import type { Module } from "@/lib/types";
import { Card } from "@/components/Card";
import styles from "@/routes/AllModulesPage/AllModulesPage.module.css";

export function AllModulesPage() {
  const [modules, setModules] = useState<Module[]>([]);
  const [lastScores, setLastScores] = useState<Record<string, LastScore>>({});
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

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

  if (loading) return <div className={styles.state}>Loading…</div>;
  if (error) return <div className={styles.state}>Error: {error}</div>;

  return (
    <div className={styles.page}>
      <h1 className={styles.heading}>All modules</h1>
      <p className={styles.subtitle}>
        Every module available right now. Pick one to set up a session.
      </p>
      {modules.length === 0 ? (
        <Card className={styles.empty}>
          <p className={styles.emptyText}>No modules available yet.</p>
        </Card>
      ) : (
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
      )}
    </div>
  );
}
