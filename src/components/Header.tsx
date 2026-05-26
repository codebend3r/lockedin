import { Link } from "wouter";
import { LogOut } from "lucide-react";
import { useAuthStore } from "@/store/authStore";
import { Button } from "@/components/Button";
import { Logo } from "@/components/Logo";
import { ThemeToggle } from "@/components/ThemeToggle";
import styles from "@/components/Header.module.css";

export function Header() {
  const user = useAuthStore((s) => s.user);
  const signOut = useAuthStore((s) => s.signOut);

  return (
    <header className={styles.header}>
      <Link href="/" className={styles.brand}>
        <Logo size={32} />
        <span>Locked In</span>
      </Link>
      <div className={styles.right}>
        <ThemeToggle />
        {user ? (
          <>
            <span className={styles.email}>{user.email}</span>
            <Button
              variant="ghost"
              onClick={() => signOut()}
              aria-label="Sign out"
              title="Sign out"
            >
              <LogOut size={16} />
              <span className={styles.signOutLabel}>Sign out</span>
            </Button>
          </>
        ) : null}
      </div>
    </header>
  );
}
