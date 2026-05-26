import ReactMarkdown from "react-markdown";
import rehypeHighlight from "rehype-highlight";
import type { ReactNode } from "react";
import "highlight.js/styles/github.css";
import "@/components/Markdown.css";

type Props = {
  children: string;
  inline?: boolean;
};

const inlineComponents = {
  p: ({ children }: { children?: ReactNode }) => <>{children}</>,
};

const rehypePlugins = [
  [rehypeHighlight, { detect: true, subset: ["javascript", "typescript"] }],
] as never;

export function Markdown({ children, inline = false }: Props) {
  return (
    <ReactMarkdown
      rehypePlugins={rehypePlugins}
      components={inline ? inlineComponents : undefined}
    >
      {children}
    </ReactMarkdown>
  );
}
