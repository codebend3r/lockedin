export function shuffle<T>(items: readonly T[]): T[] {
  const out = items.slice();
  for (let i = out.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [out[i], out[j]] = [out[j], out[i]];
  }
  return out;
}

export function sampleN<T>(items: readonly T[], n: number): T[] {
  if (n >= items.length) return shuffle(items);
  return shuffle(items).slice(0, n);
}
