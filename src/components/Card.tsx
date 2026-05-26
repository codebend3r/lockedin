import type { HTMLAttributes, ReactNode } from "react";
import styles from "./Card.module.css";

interface Props extends HTMLAttributes<HTMLDivElement> {
  children: ReactNode;
}

export function Card({ children, className, ...rest }: Props) {
  const cls = [styles.card, className ?? ""].filter(Boolean).join(" ");
  return (
    <div className={cls} {...rest}>
      {children}
    </div>
  );
}
