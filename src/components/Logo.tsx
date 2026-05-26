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
      <path
        d="M 8 22 L 8 46 L 32 56 L 32 32 Z"
        className={styles.face}
        opacity="0.55"
      />
      <path
        d="M 56 22 L 56 46 L 32 56 L 32 32 Z"
        className={styles.face}
        opacity="0.75"
      />
      <path
        d="M 32 12 L 56 22 L 32 32 L 8 22 Z"
        className={styles.face}
      />
      <circle cx="20" cy="22" r="2.5" className={styles.item} />
      <rect x="29" y="19" width="8" height="4" rx="1" className={styles.item} />
      <circle cx="44" cy="24" r="2.5" className={styles.item} />
    </svg>
  );
}
