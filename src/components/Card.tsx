import type { HTMLAttributes, ReactNode } from "react";
import styles from "@/components/Card.module.css";

type Props = HTMLAttributes<HTMLDivElement> & {
  children: ReactNode;
};

export function Card({ children, className, ...rest }: Props) {
  const cls = [styles.card, className ?? ""].filter(Boolean).join(" ");
  return (
    <div className={cls} {...rest}>
      {children}
    </div>
  );
}
