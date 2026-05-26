import { useEffect } from "react";
import { Route, Switch } from "wouter";
import { useAuthStore } from "@/store/authStore";
import { RequireAuth } from "@/components/RequireAuth";
import { Header } from "@/components/Header";
import { Footer } from "@/components/Footer";
import { Sidebar } from "@/components/Sidebar";
import { OnboardingModal } from "@/components/OnboardingModal";
import { LoginPage } from "@/routes/LoginPage/LoginPage";
import { HomePage } from "@/routes/HomePage/HomePage";
import { ModulePage } from "@/routes/ModulePage/ModulePage";
import { QuizPage } from "@/routes/QuizPage/QuizPage";
import { ResultsPage } from "@/routes/ResultsPage/ResultsPage";
import { DesignSystem } from "@/routes/DesignSystem/DesignSystem";
import { InProgressPage } from "@/routes/InProgressPage/InProgressPage";
import { AllModulesPage } from "@/routes/AllModulesPage/AllModulesPage";
import { AppSettingsPage } from "@/routes/AppSettingsPage/AppSettingsPage";
import { PreferencesPage } from "@/routes/PreferencesPage/PreferencesPage";
import styles from "@/App.module.css";

export function App() {
  const bootstrap = useAuthStore((s) => s.bootstrap);
  const status = useAuthStore((s) => s.status);
  const user = useAuthStore((s) => s.user);

  useEffect(() => {
    void bootstrap();
  }, [bootstrap]);

  const needsOnboarding =
    status === "authenticated" &&
    !!user &&
    user.user_metadata?.onboarded !== true;

  if (status === "loading") {
    return (
      <div style={{ padding: 24, color: "var(--color-text-muted)" }}>
        Loading…
      </div>
    );
  }

  return (
    <>
      <Header />
      <div className={styles.body}>
        <Sidebar />
        <main className={styles.main}>
          <Switch>
          <Route path="/login">
            <LoginPage />
          </Route>
          <Route path="/_design">
            <DesignSystem />
          </Route>
          <Route path="/in-progress">
            <RequireAuth>
              <InProgressPage />
            </RequireAuth>
          </Route>
          <Route path="/all-modules">
            <RequireAuth>
              <AllModulesPage />
            </RequireAuth>
          </Route>
          <Route path="/app-settings">
            <RequireAuth>
              <AppSettingsPage />
            </RequireAuth>
          </Route>
          <Route path="/preferences">
            <RequireAuth>
              <PreferencesPage />
            </RequireAuth>
          </Route>
          <Route path="/">
            <RequireAuth>
              <HomePage />
            </RequireAuth>
          </Route>
          <Route path="/m/:slug">
            {(params) => (
              <RequireAuth>
                <ModulePage params={params} />
              </RequireAuth>
            )}
          </Route>
          <Route path="/m/:slug/quiz">
            {(params) => (
              <RequireAuth>
                <QuizPage params={params} />
              </RequireAuth>
            )}
          </Route>
          <Route path="/m/:slug/results/:id">
            {(params) => (
              <RequireAuth>
                <ResultsPage params={params} />
              </RequireAuth>
            )}
          </Route>
          <Route>
            <div style={{ padding: 24 }}>Not found</div>
          </Route>
        </Switch>
        </main>
      </div>
      <Footer />
      {needsOnboarding ? <OnboardingModal /> : null}
    </>
  );
}
