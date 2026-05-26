import { useEffect, useRef, useState } from "react";
import { Link, useLocation } from "wouter";
import {
  GraduationCap,
  LogOut,
  Monitor,
  Moon,
  PlayCircle,
  Sun,
} from "lucide-react";
import { useUIStore } from "@/store/uiStore";
import { useAuthStore } from "@/store/authStore";
import { useThemeStore } from "@/store/themeStore";
import { useSessionStore } from "@/store/sessionStore";
import { fetchModules } from "@/lib/queries";
import type { Mode, Module } from "@/lib/types";
import styles from "@/components/Sidebar.module.css";

const MODE_LABEL: Record<Mode, string> = {
  multiple_choice: "Multiple choice",
  flashcards: "Flashcards",
  recap: "Recap",
};

export function Sidebar() {
  const open = useUIStore((s) => s.sidebarOpen);
  const setOpen = useUIStore((s) => s.setSidebarOpen);
  const status = useAuthStore((s) => s.status);
  const user = useAuthStore((s) => s.user);
  const signOut = useAuthStore((s) => s.signOut);
  const themeMode = useThemeStore((s) => s.mode);
  const setThemeMode = useThemeStore((s) => s.setMode);
  const sessionId = useSessionStore((s) => s.sessionId);
  const sessionModuleId = useSessionStore((s) => s.moduleId);
  const sessionMode = useSessionStore((s) => s.mode);
  const totalQuestions = useSessionStore((s) => s.questions.length);
  const answeredCount = useSessionStore((s) => s.answers.length);
  const [location] = useLocation();
  const [modules, setModules] = useState<Module[]>([]);

  useEffect(() => {
    if (status !== "authenticated") return;
    const state = { alive: true };
    (async () => {
      try {
        const ms = await fetchModules();
        if (state.alive) setModules(ms);
      } catch {
        // sidebar list is non-critical
      }
    })();
    return () => {
      state.alive = false;
    };
  }, [status]);

  const firstMount = useRef(true);
  useEffect(() => {
    if (firstMount.current) {
      firstMount.current = false;
      return;
    }
    if (window.matchMedia("(max-width: 767px)").matches) {
      setOpen(false);
    }
  }, [location, setOpen]);

  useEffect(() => {
    if (!open) return;
    const onKey = (e: KeyboardEvent) => {
      if (e.key === "Escape" && window.matchMedia("(max-width: 767px)").matches) {
        setOpen(false);
      }
    };
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
  }, [open, setOpen]);

  const activeModule =
    sessionId && sessionModuleId
      ? modules.find((m) => m.id === sessionModuleId) ?? null
      : null;
  const hasInProgress =
    !!activeModule &&
    !!sessionMode &&
    totalQuestions > 0 &&
    answeredCount < totalQuestions;

  return (
    <>
      <aside
        className={styles.sidebar}
        data-open={open}
        aria-hidden={!open}
      >
        <nav className={styles.nav}>
          <div className={styles.section}>In progress</div>
          {hasInProgress && activeModule && sessionMode ? (
            <Link
              href={`/m/${activeModule.slug}/quiz`}
              className={styles.progressItem}
            >
              <PlayCircle size={16} />
              <span className={styles.progressBody}>
                <span className={styles.progressName}>{activeModule.name}</span>
                <span className={styles.progressMeta}>
                  {answeredCount}/{totalQuestions} · {MODE_LABEL[sessionMode]}
                </span>
              </span>
            </Link>
          ) : (
            <div className={styles.empty}>Nothing in progress</div>
          )}

          <div className={styles.section}>All modules</div>
          {modules.length > 0 ? (
            modules.map((m) => {
              const path = `/m/${m.slug}`;
              const active = location === path || location.startsWith(`${path}/`);
              return (
                <Link
                  key={m.id}
                  href={path}
                  className={active ? styles.itemActive : styles.item}
                >
                  <GraduationCap size={16} />
                  <span>{m.name}</span>
                </Link>
              );
            })
          ) : (
            <div className={styles.empty}>
              {status === "authenticated" ? "Loading…" : "Sign in to view"}
            </div>
          )}

          <div className={styles.section}>App settings</div>
          <div className={styles.settingRow}>
            <span className={styles.settingLabel}>Theme</span>
            <div className={styles.themeGroup} role="radiogroup" aria-label="Theme">
              <button
                type="button"
                onClick={() => setThemeMode("light")}
                className={
                  themeMode === "light" ? styles.themeActive : styles.themeOption
                }
                aria-pressed={themeMode === "light"}
                aria-label="Light"
                title="Light"
              >
                <Sun size={14} />
              </button>
              <button
                type="button"
                onClick={() => setThemeMode("dark")}
                className={
                  themeMode === "dark" ? styles.themeActive : styles.themeOption
                }
                aria-pressed={themeMode === "dark"}
                aria-label="Dark"
                title="Dark"
              >
                <Moon size={14} />
              </button>
              <button
                type="button"
                onClick={() => setThemeMode("system")}
                className={
                  themeMode === "system" ? styles.themeActive : styles.themeOption
                }
                aria-pressed={themeMode === "system"}
                aria-label="System"
                title="System"
              >
                <Monitor size={14} />
              </button>
            </div>
          </div>

          <div className={styles.section}>Account preferences</div>
          {user ? (
            <>
              <div className={styles.email} title={user.email ?? undefined}>
                {user.email}
              </div>
              <button
                type="button"
                onClick={() => signOut()}
                className={styles.signOut}
              >
                <LogOut size={16} />
                <span>Sign out</span>
              </button>
            </>
          ) : (
            <Link href="/login" className={styles.item}>
              <span>Sign in</span>
            </Link>
          )}
        </nav>
      </aside>
      {open ? (
        <button
          type="button"
          className={styles.backdrop}
          onClick={() => setOpen(false)}
          aria-label="Close menu"
          tabIndex={-1}
        />
      ) : null}
    </>
  );
}
