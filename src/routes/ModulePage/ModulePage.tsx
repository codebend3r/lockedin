import { useEffect, useMemo, useState } from "react";
import { useLocation, Link } from "wouter";
import {
  fetchModuleBySlug,
  fetchQuestionsForModule,
  createSession,
} from "@/lib/queries";
import type { Mode, Module } from "@/lib/types";
import { sampleN, shuffle } from "@/lib/sampling";
import { useSessionStore } from "@/store/sessionStore";
import { Card } from "@/components/Card";
import { Button } from "@/components/Button";
import styles from "./ModulePage.module.css";

const MODES: Array<{ value: Mode; label: string; help: string }> = [
  {
    value: "multiple_choice",
    label: "Multiple Choice",
    help: "Pick from four options. Instant feedback.",
  },
  {
    value: "flashcards",
    label: "Flashcards",
    help: "Front prompts, flip to reveal, self-grade.",
  },
  {
    value: "recap",
    label: "Recap",
    help: "Think your answer, reveal the canonical one, self-grade.",
  },
];

const SIZE_OPTIONS = [10, 20, 50] as const;

type Params = {
  slug: string;
};

export function ModulePage({ params }: { params: Params }) {
  const [module, setModule] = useState<Module | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [mode, setMode] = useState<Mode>("multiple_choice");
  const [size, setSize] = useState<number | "all">("all");
  const [starting, setStarting] = useState(false);
  const start = useSessionStore((s) => s.start);
  const [, navigate] = useLocation();

  useEffect(() => {
    let alive = true;
    (async () => {
      try {
        const m = await fetchModuleBySlug(params.slug);
        if (!alive) return;
        setModule(m);
        if (m?.type === "dynamic") setSize(20);
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
  }, [params.slug]);

  const sizeChoices = useMemo(() => {
    if (!module) return [] as Array<number | "all">;
    if (module.type === "static") return ["all"];
    return [...SIZE_OPTIONS, "all"];
  }, [module]);

  const handleStart = async () => {
    if (!module) return;
    setStarting(true);
    try {
      const all = await fetchQuestionsForModule(module.id);
      const effectiveSize =
        module.type === "static" || size === "all" ? all.length : size;
      const picked =
        module.type === "static" ? shuffle(all) : sampleN(all, effectiveSize);
      const session = await createSession({
        moduleId: module.id,
        mode,
        sessionSize: picked.length,
      });
      start({
        sessionId: session.id,
        moduleId: module.id,
        mode,
        questions: picked,
      });
      navigate(`/m/${module.slug}/quiz`);
    } catch (e) {
      setError(e instanceof Error ? e.message : "Failed to start");
      setStarting(false);
    }
  };

  if (loading) return <div className={styles.state}>Loading…</div>;
  if (error) return <div className={styles.state}>Error: {error}</div>;
  if (!module) return <div className={styles.state}>Module not found.</div>;

  return (
    <div className={styles.page}>
      <Link href="/" className={styles.back}>
        ← Back
      </Link>
      <h1 className={styles.heading}>{module.name}</h1>
      <p className={styles.subtitle}>{module.description}</p>

      <Card className={styles.section}>
        <h2 className={styles.sectionTitle}>Mode</h2>
        <div className={styles.modeGrid}>
          {MODES.map((m) => (
            <button
              key={m.value}
              type="button"
              onClick={() => setMode(m.value)}
              className={mode === m.value ? styles.modeActive : styles.mode}
            >
              <span className={styles.modeLabel}>{m.label}</span>
              <span className={styles.modeHelp}>{m.help}</span>
            </button>
          ))}
        </div>
      </Card>

      <Card className={styles.section}>
        <h2 className={styles.sectionTitle}>Session size</h2>
        {module.type === "static" ? (
          <p className={styles.staticNote}>
            This is a static module — you'll see all {module.total_questions}{" "}
            questions, order shuffled.
          </p>
        ) : (
          <div className={styles.sizeRow}>
            {sizeChoices.map((n) => {
              const value = n === "all" ? module.total_questions : n;
              const active = size === n;
              return (
                <button
                  key={String(n)}
                  type="button"
                  onClick={() => setSize(n as number | "all")}
                  className={active ? styles.sizeActive : styles.size}
                >
                  {n === "all" ? `All (${value})` : `${value}`}
                </button>
              );
            })}
          </div>
        )}
      </Card>

      <Button onClick={handleStart} disabled={starting} block>
        {starting ? "Starting…" : "Start"}
      </Button>
    </div>
  );
}
