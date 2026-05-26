import { useEffect, type ReactNode } from "react";
import { useLocation } from "wouter";
import { useAuthStore } from "@/store/authStore";

type Props = {
  children: ReactNode;
};

export function RequireAuth({ children }: Props) {
  const status = useAuthStore((s) => s.status);
  const [, navigate] = useLocation();

  useEffect(() => {
    if (status === "unauthenticated") {
      navigate("/login", { replace: true });
    }
  }, [status, navigate]);

  if (status !== "authenticated") return null;
  return <>{children}</>;
}
