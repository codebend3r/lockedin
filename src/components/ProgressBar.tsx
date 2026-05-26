import styles from "@/components/ProgressBar.module.css";

type Props = {
  current: number;
  total: number;
};

export function ProgressBar({ current, total }: Props) {
  const pct = total === 0 ? 0 : Math.min(100, (current / total) * 100);
  return (
    <div className={styles.wrap} aria-label={`Question ${current} of ${total}`}>
      <div className={styles.bar} style={{ width: `${pct}%` }} />
    </div>
  );
}
