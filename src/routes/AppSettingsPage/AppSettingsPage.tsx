import { Monitor, Moon, Sun } from "lucide-react";
import { Card } from "@/components/Card";
import { useThemeStore } from "@/store/themeStore";
import styles from "@/routes/AppSettingsPage/AppSettingsPage.module.css";

type ThemeOption = {
  value: "light" | "dark" | "system";
  label: string;
  icon: typeof Sun;
  hint: string;
};

const THEME_OPTIONS: ThemeOption[] = [
  { value: "light", label: "Light", icon: Sun, hint: "Always light" },
  { value: "dark", label: "Dark", icon: Moon, hint: "Always dark" },
  {
    value: "system",
    label: "System",
    icon: Monitor,
    hint: "Match your OS",
  },
];

export function AppSettingsPage() {
  const mode = useThemeStore((s) => s.mode);
  const setMode = useThemeStore((s) => s.setMode);

  return (
    <div className={styles.page}>
      <h1 className={styles.heading}>App settings</h1>
      <p className={styles.subtitle}>
        Adjust how Locked In looks. Changes save automatically.
      </p>

      <Card className={styles.card}>
        <div className={styles.section}>
          <div className={styles.sectionHead}>
            <h2 className={styles.sectionTitle}>Theme</h2>
            <p className={styles.sectionHint}>
              Switch between light and dark, or follow your system preference.
            </p>
          </div>
          <div className={styles.themeRow} role="radiogroup" aria-label="Theme">
            {THEME_OPTIONS.map(({ value, label, icon: Icon, hint }) => {
              const active = mode === value;
              return (
                <button
                  key={value}
                  type="button"
                  role="radio"
                  aria-checked={active}
                  onClick={() => setMode(value)}
                  className={active ? styles.themeActive : styles.themeOption}
                  title={hint}
                >
                  <Icon size={18} />
                  <span className={styles.themeLabel}>{label}</span>
                  <span className={styles.themeHint}>{hint}</span>
                </button>
              );
            })}
          </div>
        </div>
      </Card>
    </div>
  );
}
