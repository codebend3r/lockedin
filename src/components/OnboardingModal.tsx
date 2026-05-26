import { useState } from "react";
import { supabase } from "@/lib/supabase";
import { useAuthStore } from "@/store/authStore";
import { Button } from "@/components/Button";
import styles from "@/components/OnboardingModal.module.css";

export function OnboardingModal() {
  const [firstName, setFirstName] = useState("");
  const [lastInitial, setLastInitial] = useState("");
  const [busy, setBusy] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const finish = async (data: Record<string, unknown>) => {
    setBusy(true);
    setError(null);
    try {
      const { data: result, error: err } = await supabase.auth.updateUser({
        data,
      });
      if (err) throw err;
      if (result.user) {
        useAuthStore.setState({ user: result.user });
      }
    } catch (e) {
      setError(e instanceof Error ? e.message : "Failed to save");
      setBusy(false);
    }
  };

  const save = (e: React.FormEvent) => {
    e.preventDefault();
    void finish({
      first_name: firstName.trim(),
      last_initial: lastInitial.trim().slice(0, 1).toUpperCase(),
      onboarded: true,
    });
  };

  const dismiss = () => {
    void finish({ onboarded: true });
  };

  return (
    <div className={styles.overlay} role="presentation">
      <div
        className={styles.modal}
        role="dialog"
        aria-modal="true"
        aria-labelledby="onboarding-title"
      >
        <h2 id="onboarding-title" className={styles.title}>
          Welcome to Locked In
        </h2>
        <p className={styles.subtitle}>
          What should we call you? You can change this any time in Preferences.
        </p>
        <form className={styles.form} onSubmit={save}>
          <label className={styles.field}>
            <span className={styles.label}>First name</span>
            <input
              type="text"
              required
              value={firstName}
              onChange={(e) => setFirstName(e.target.value)}
              className={styles.input}
              autoFocus
              autoComplete="given-name"
              maxLength={40}
            />
          </label>
          <label className={styles.field}>
            <span className={styles.label}>Last name initial</span>
            <input
              type="text"
              maxLength={1}
              value={lastInitial}
              onChange={(e) =>
                setLastInitial(e.target.value.toUpperCase().slice(0, 1))
              }
              className={`${styles.input} ${styles.initialInput}`}
              autoComplete="off"
              placeholder="R"
            />
          </label>
          {error ? <div className={styles.error}>{error}</div> : null}
          <div className={styles.actions}>
            <Button
              type="button"
              variant="ghost"
              onClick={dismiss}
              disabled={busy}
            >
              Maybe later
            </Button>
            <Button type="submit" disabled={busy || !firstName.trim()}>
              {busy ? "Saving…" : "Save"}
            </Button>
          </div>
        </form>
      </div>
    </div>
  );
}
