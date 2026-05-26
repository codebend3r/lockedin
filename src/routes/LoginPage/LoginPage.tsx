import { useEffect, useState } from "react";
import { useLocation } from "wouter";
import { useAuthStore } from "@/store/authStore";
import { Button } from "@/components/Button";
import { Card } from "@/components/Card";
import styles from "./LoginPage.module.css";

type Tab = "signin" | "signup";

export function LoginPage() {
  const status = useAuthStore((s) => s.status);
  const signIn = useAuthStore((s) => s.signIn);
  const signUp = useAuthStore((s) => s.signUp);
  const signInWithMagicLink = useAuthStore((s) => s.signInWithMagicLink);
  const [, navigate] = useLocation();

  const [tab, setTab] = useState<Tab>("signin");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [busy, setBusy] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [info, setInfo] = useState<string | null>(null);

  useEffect(() => {
    if (status === "authenticated") navigate("/", { replace: true });
  }, [status, navigate]);

  const submit = async (e: React.FormEvent) => {
    e.preventDefault();
    setBusy(true);
    setError(null);
    setInfo(null);
    try {
      if (tab === "signin") await signIn(email, password);
      else {
        await signUp(email, password);
        setInfo(
          "Account created. Check your email if confirmation is required, otherwise you're signed in."
        );
      }
    } catch (e) {
      setError(e instanceof Error ? e.message : "Something went wrong");
    } finally {
      setBusy(false);
    }
  };

  const magicLink = async () => {
    setBusy(true);
    setError(null);
    setInfo(null);
    try {
      await signInWithMagicLink(email);
      setInfo("Magic link sent. Check your email.");
    } catch (e) {
      setError(e instanceof Error ? e.message : "Something went wrong");
    } finally {
      setBusy(false);
    }
  };

  return (
    <div className={styles.page}>
      <Card className={styles.card}>
        <h1 className={styles.title}>Locked In</h1>
        <p className={styles.subtitle}>
          Brush up before the test. Sign in to track your progress.
        </p>

        <div className={styles.tabs}>
          <button
            type="button"
            className={tab === "signin" ? styles.activeTab : styles.tab}
            onClick={() => setTab("signin")}
          >
            Sign in
          </button>
          <button
            type="button"
            className={tab === "signup" ? styles.activeTab : styles.tab}
            onClick={() => setTab("signup")}
          >
            Sign up
          </button>
        </div>

        <form className={styles.form} onSubmit={submit}>
          <label className={styles.label}>
            Email
            <input
              type="email"
              required
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              className={styles.input}
              autoComplete="email"
            />
          </label>
          <label className={styles.label}>
            Password
            <input
              type="password"
              required
              minLength={6}
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              className={styles.input}
              autoComplete={tab === "signin" ? "current-password" : "new-password"}
            />
          </label>

          {error ? <div className={styles.error}>{error}</div> : null}
          {info ? <div className={styles.info}>{info}</div> : null}

          <Button type="submit" block disabled={busy}>
            {busy ? "…" : tab === "signin" ? "Continue" : "Create account"}
          </Button>
        </form>

        <div className={styles.divider}>or</div>

        <Button
          type="button"
          variant="secondary"
          block
          disabled={busy || !email}
          onClick={magicLink}
        >
          Email me a magic link
        </Button>
      </Card>
    </div>
  );
}
