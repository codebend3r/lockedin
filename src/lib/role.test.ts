import type { User } from "@supabase/supabase-js";
import { describe, expect, it } from "vitest";
import { getRole } from "./role";

const userWithRole = (role: string): User =>
  ({ app_metadata: { role } }) as unknown as User;

describe("getRole", () => {
  it("returns 'regular' when the user is null", () => {
    expect(getRole(null)).toBe("regular");
  });

  it("returns the role when app_metadata.role is admin", () => {
    expect(getRole(userWithRole("admin"))).toBe("admin");
  });

  it("returns 'regular' when app_metadata.role is unknown", () => {
    expect(getRole(userWithRole("hacker"))).toBe("regular");
  });
});
