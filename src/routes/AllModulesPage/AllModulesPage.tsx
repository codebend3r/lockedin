import { useEffect, useMemo, useState } from "react";
import { Link } from "wouter";
import {
  fetchModules,
  fetchLastScoreByModule,
  fetchRequestCategories,
  type LastScore,
} from "@/lib/queries";
import type { Module, RequestCategory } from "@/lib/types";
import { categoryForModule } from "@/lib/moduleCategories";
import { Card } from "@/components/Card";
import styles from "@/routes/AllModulesPage/AllModulesPage.module.css";

export function AllModulesPage() {
  const [modules, setModules] = useState<Module[]>([]);
  const [categories, setCategories] = useState<RequestCategory[]>([]);
  const [lastScores, setLastScores] = useState<Record<string, LastScore>>({});
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const state = { alive: true };
    (async () => {
      try {
        const [ms, cs, ls] = await Promise.all([
          fetchModules(),
          fetchRequestCategories(),
          fetchLastScoreByModule(),
        ]);
        if (!state.alive) return;
        setModules(ms);
        setCategories(cs);
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

  const modulesByCategory = useMemo(() => {
    const grouped: Record<string, Module[]> = {};
    for (const m of modules) {
      const slug = categoryForModule(m.slug);
      (grouped[slug] ??= []).push(m);
    }
    return grouped;
  }, [modules]);

  if (loading) return <div className={styles.state}>Loading…</div>;
  if (error) return <div className={styles.state}>Error: {error}</div>;

  return (
    <div className={styles.page}>
      <h1 className={styles.heading}>All modules</h1>
      <p className={styles.subtitle}>
        Every module available right now. Pick one to set up a session.
      </p>
      <div className={styles.sections}>
        {categories.map((cat) => {
          const inCategory = modulesByCategory[cat.slug] ?? [];
          return (
            <section key={cat.id} className={styles.section}>
              <h2 className={styles.sectionHeading}>{cat.name}</h2>
              {inCategory.length === 0 ? (
                <Card className={styles.placeholder}>
                  <p className={styles.placeholderText}>Cramming up</p>
                </Card>
              ) : (
                <div className={styles.grid}>
                  {inCategory.map((m) => {
                    const last = lastScores[m.id];
                    return (
                      <Link
                        key={m.id}
                        href={`/m/${m.slug}`}
                        className={styles.cardLink}
                      >
                        <Card className={styles.card}>
                          <div className={styles.badgeRow}>
                            <span className={styles.badge} data-type={m.type}>
                              {m.type}
                            </span>
                            <span className={styles.count}>
                              {m.total_questions} questions
                            </span>
                          </div>
                          <h3 className={styles.name}>{m.name}</h3>
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
            </section>
          );
        })}
      </div>
    </div>
  );
}
