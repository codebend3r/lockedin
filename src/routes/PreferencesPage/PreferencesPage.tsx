import { useEffect, useState } from "react";
import { supabase } from "@/lib/supabase";
import { useAuthStore } from "@/store/authStore";
import { Button } from "@/components/Button";
import { Card } from "@/components/Card";
import styles from "@/routes/PreferencesPage/PreferencesPage.module.css";

function readString(value: unknown): string {
  return typeof value === "string" ? value : "";
}

export function PreferencesPage() {
  const user = useAuthStore((s) => s.user);
  const metaFirstName = readString(user?.user_metadata?.first_name);
  const metaLastInitial = readString(user?.user_metadata?.last_initial);

  const [firstName, setFirstName] = useState(metaFirstName);
  const [lastInitial, setLastInitial] = useState(metaLastInitial);
  const [busy, setBusy] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState(false);

  useEffect(() => {
    setFirstName(metaFirstName);
  }, [metaFirstName]);
  useEffect(() => {
    setLastInitial(metaLastInitial);
  }, [metaLastInitial]);

  const dirty =
    firstName.trim() !== metaFirstName ||
    lastInitial.trim().toUpperCase() !== metaLastInitial;

  const save = async (e: React.FormEvent) => {
    e.preventDefault();
    setBusy(true);
    setError(null);
    setSuccess(false);
    try {
      const { data, error: err } = await supabase.auth.updateUser({
        data: {
          first_name: firstName.trim(),
          last_initial: lastInitial.trim().slice(0, 1).toUpperCase(),
        },
      });
      if (err) throw err;
      if (data.user) useAuthStore.setState({ user: data.user });
      setSuccess(true);
    } catch (e) {
      setError(e instanceof Error ? e.message : "Failed to save");
    } finally {
      setBusy(false);
    }
  };

  return (
    <div className={styles.page}>
      <h1 className={styles.heading}>Preferences</h1>
      <p className={styles.subtitle}>
        Your display name is stored with your account and only visible to you.
      </p>
      <Card className={styles.card}>
        <form className={styles.form} onSubmit={save}>
          <label className={styles.field}>
            <span className={styles.label}>First name</span>
            <input
              type="text"
              value={firstName}
              onChange={(e) => setFirstName(e.target.value)}
              className={styles.input}
              autoComplete="given-name"
              maxLength={40}
              placeholder="e.g. CJ"
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
          {success ? <div className={styles.success}>Saved.</div> : null}
          <div className={styles.actions}>
            <Button type="submit" disabled={busy || !dirty}>
              {busy ? "Saving…" : "Save changes"}
            </Button>
          </div>
        </form>
      </Card>
    </div>
  );
}
