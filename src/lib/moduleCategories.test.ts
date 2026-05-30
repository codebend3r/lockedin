import { describe, expect, it } from "vitest";
import { categoryForModule } from "./moduleCategories";

describe("categoryForModule", () => {
  it("maps a known module slug to its category", () => {
    expect(categoryForModule("javascript-1")).toBe("programming-languages");
  });

  it("falls back to 'other' for an unknown slug", () => {
    expect(categoryForModule("not-a-real-slug")).toBe("other");
  });
});
