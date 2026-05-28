import { describe, expect, it } from "vitest";
import { sampleN } from "./sampling";

describe("sampleN", () => {
  it("returns n elements drawn from the input with no duplicates when n < items.length", () => {
    const input = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] as const;
    const result = sampleN(input, 3);

    expect(result).toHaveLength(3);
    for (const value of result) {
      expect(input).toContain(value);
    }
    expect(new Set(result).size).toBe(result.length);
  });
});
