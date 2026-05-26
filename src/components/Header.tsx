import { Link } from "wouter";
import { LogOut, Menu } from "lucide-react";
import { useAuthStore } from "@/store/authStore";
import { useUIStore } from "@/store/uiStore";
import { Button } from "@/components/Button";
import { Logo } from "@/components/Logo";
import { ThemeToggle } from "@/components/ThemeToggle";
import styles from "@/components/Header.module.css";

export function Header() {
  const user = useAuthStore((s) => s.user);
  const signOut = useAuthStore((s) => s.signOut);
  const toggleSidebar = useUIStore((s) => s.toggleSidebar);

  return (
    <header className={styles.header}>
      <div className={styles.left}>
        <button
          type="button"
          onClick={toggleSidebar}
          className={styles.menuToggle}
          aria-label="Toggle navigation"
          title="Toggle navigation"
        >
          <Menu size={20} />
        </button>
        <Link href="/" className={styles.brand}>
          <Logo size={32} />
          <span>Locked In</span>
        </Link>
      </div>
      <div className={styles.right}>
        <ThemeToggle />
        {user ? (
          <>
            <span
              className={styles.email}
              title={user.email ?? undefined}
            >
              {(() => {
                const first =
                  typeof user.user_metadata?.first_name === "string"
                    ? user.user_metadata.first_name.trim()
                    : "";
                const initial =
                  typeof user.user_metadata?.last_initial === "string"
                    ? user.user_metadata.last_initial.trim().slice(0, 1).toUpperCase()
                    : "";
                if (first) return initial ? `${first} ${initial}.` : first;
                return user.email;
              })()}
            </span>
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
