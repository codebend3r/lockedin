export const MODULE_CATEGORY_SLUG: Record<string, string> = {
  g1: "driving-licensing",
  javascript: "programming-languages",
  typescript: "programming-languages",
  python: "programming-languages",
  c: "programming-languages",
  cpp: "programming-languages",
  java: "programming-languages",
  csharp: "programming-languages",
  sql: "programming-languages",
  go: "programming-languages",
  rust: "programming-languages",
  "real-estate": "test-prep",
  english: "languages",
  spanish: "languages",
  french: "languages",
  japanese: "languages",
  italian: "languages",
  portuguese: "languages",
};

export const DEFAULT_CATEGORY_SLUG = "other";

export function categoryForModule(moduleSlug: string): string {
  return MODULE_CATEGORY_SLUG[moduleSlug] ?? DEFAULT_CATEGORY_SLUG;
}
