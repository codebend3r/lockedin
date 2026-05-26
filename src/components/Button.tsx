import type { ButtonHTMLAttributes } from "react";
import styles from "./Button.module.css";

type Variant = "primary" | "secondary" | "ghost" | "danger";

interface Props extends ButtonHTMLAttributes<HTMLButtonElement> {
  variant?: Variant;
  block?: boolean;
}

export function Button({
  variant = "primary",
  block = false,
  className,
  ...rest
}: Props) {
  const classes = [
    styles.button,
    styles[variant],
    block ? styles.block : "",
    className ?? "",
  ]
    .filter(Boolean)
    .join(" ");
  return <button className={classes} {...rest} />;
}
