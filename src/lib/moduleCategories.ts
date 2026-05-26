export const MODULE_CATEGORY_SLUG: Record<string, string> = {
  g1: "driving-licensing",
  javascript: "programming-languages",
  typescript: "programming-languages",
};

export const DEFAULT_CATEGORY_SLUG = "other";

export function categoryForModule(moduleSlug: string): string {
  return MODULE_CATEGORY_SLUG[moduleSlug] ?? DEFAULT_CATEGORY_SLUG;
}
