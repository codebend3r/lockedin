import styles from "@/components/Logo.module.css";

type Props = {
  size?: number;
  title?: string;
};

export function Logo({ size = 20, title }: Props) {
  return (
    <svg
      xmlns="http://www.w3.org/2000/svg"
      width={size}
      height={size}
      viewBox="0 0 64 64"
      role={title ? "img" : undefined}
      aria-hidden={title ? undefined : true}
      aria-label={title}
    >
      {title ? <title>{title}</title> : null}
      <circle className={styles.ring} cx="26" cy="38" r="22" />
      <circle className={styles.ring} cx="26" cy="38" r="12" />
      <circle className={styles.bull} cx="26" cy="38" r="3" />
      <line className={styles.shaft} x1="26" y1="38" x2="50" y2="14" />
      <polygon className={styles.fletch} points="50,14 58,16 56,8 48,6" />
    </svg>
  );
}
