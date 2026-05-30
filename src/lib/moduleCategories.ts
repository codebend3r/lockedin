export const MODULE_CATEGORY_SLUG: Record<string, string> = {
  g1: "driving-licensing",
  "javascript-1": "programming-languages",
  "javascript-2": "programming-languages",
  "javascript-3": "programming-languages",
  "typescript-1": "programming-languages",
  "typescript-2": "programming-languages",
  "typescript-3": "programming-languages",
  "python-1": "programming-languages",
  "python-2": "programming-languages",
  "python-3": "programming-languages",
  c: "programming-languages",
  cpp: "programming-languages",
  java: "programming-languages",
  csharp: "programming-languages",
  sql: "programming-languages",
  go: "programming-languages",
  "rust-1": "programming-languages",
  "rust-2": "programming-languages",
  "rust-3": "programming-languages",
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
