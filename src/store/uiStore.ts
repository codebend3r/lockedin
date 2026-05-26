import { create } from "zustand";
import { persist } from "zustand/middleware";

type UIState = {
  sidebarOpen: boolean;
  toggleSidebar: () => void;
  setSidebarOpen: (open: boolean) => void;
};

const initialOpen =
  typeof window !== "undefined"
    ? window.matchMedia("(min-width: 768px)").matches
    : true;

export const useUIStore = create<UIState>()(
  persist(
    (set) => ({
      sidebarOpen: initialOpen,
      toggleSidebar: () => set((s) => ({ sidebarOpen: !s.sidebarOpen })),
      setSidebarOpen: (open) => set({ sidebarOpen: open }),
    }),
    { name: "lockedin-ui-v1" }
  )
);
