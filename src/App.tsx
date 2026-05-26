import { useEffect } from "react";
import { Route, Switch } from "wouter";
import { useAuthStore } from "./store/authStore";
import { RequireAuth } from "./components/RequireAuth";
import { Header } from "./components/Header";
import { LoginPage } from "./routes/LoginPage/LoginPage";
import { HomePage } from "./routes/HomePage/HomePage";
import { ModulePage } from "./routes/ModulePage/ModulePage";

function Placeholder({ name }: { name: string }) {
  return <div style={{ padding: 24 }}>{name} (todo)</div>;
}

export function App() {
  const bootstrap = useAuthStore((s) => s.bootstrap);
  const status = useAuthStore((s) => s.status);

  useEffect(() => {
    void bootstrap();
  }, [bootstrap]);

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
      <main>
        <Switch>
          <Route path="/login">
            <LoginPage />
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
                <Placeholder name={`QuizPage(${params.slug})`} />
              </RequireAuth>
            )}
          </Route>
          <Route path="/m/:slug/results/:id">
            {(params) => (
              <RequireAuth>
                <Placeholder
                  name={`ResultsPage(${params.slug}/${params.id})`}
                />
              </RequireAuth>
            )}
          </Route>
          <Route>
            <div style={{ padding: 24 }}>Not found</div>
          </Route>
        </Switch>
      </main>
    </>
  );
}
