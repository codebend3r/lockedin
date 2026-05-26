import { useEffect, useState } from "react";
import { Link } from "wouter";
import {
  fetchModules,
  fetchLastScoreByModule,
  type LastScore,
} from "../../lib/queries";
import type { Module } from "../../lib/types";
import { Card } from "../../components/Card";
import styles from "./HomePage.module.css";

export function HomePage() {
  const [modules, setModules] = useState<Module[]>([]);
  const [lastScores, setLastScores] = useState<Record<string, LastScore>>({});
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    let alive = true;
    (async () => {
      try {
        const [ms, ls] = await Promise.all([
          fetchModules(),
          fetchLastScoreByModule(),
        ]);
        if (!alive) return;
        setModules(ms);
        setLastScores(ls);
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
  }, []);

  if (loading) return <div className={styles.state}>Loading…</div>;
  if (error) return <div className={styles.state}>Error: {error}</div>;

  return (
    <div className={styles.page}>
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
