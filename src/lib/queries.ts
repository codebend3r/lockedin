import { supabase } from "@/lib/supabase";
import type {
  Module,
  Question,
  Session,
  SessionAnswer,
  Mode,
} from "@/lib/types";

export async function fetchModules(): Promise<Module[]> {
  const { data, error } = await supabase
    .from("modules")
    .select("*")
    .order("created_at", { ascending: true });
  if (error) throw error;
  return data ?? [];
}

export async function fetchModuleBySlug(slug: string): Promise<Module | null> {
  const { data, error } = await supabase
    .from("modules")
    .select("*")
    .eq("slug", slug)
    .maybeSingle();
  if (error) throw error;
  return data;
}

export async function fetchQuestionsForModule(
  moduleId: string
): Promise<Question[]> {
  const { data, error } = await supabase
    .from("questions")
    .select("*, choices:question_choices(*)")
    .eq("module_id", moduleId)
    .order("order_index", { ascending: true });
  if (error) throw error;
  return (data ?? []).map((q) => ({
    ...q,
    choices: (q.choices ?? []).sort(
      (a: { order_index: number }, b: { order_index: number }) =>
        a.order_index - b.order_index
    ),
  })) as Question[];
}

export async function createSession(args: {
  moduleId: string;
  mode: Mode;
  sessionSize: number;
}): Promise<Session> {
  const { data: auth } = await supabase.auth.getUser();
  if (!auth.user) throw new Error("Not signed in");
  const { data, error } = await supabase
    .from("sessions")
    .insert({
      user_id: auth.user.id,
      module_id: args.moduleId,
      mode: args.mode,
      session_size: args.sessionSize,
    })
    .select("*")
    .single();
  if (error) throw error;
  return data as Session;
}

export async function recordAnswer(args: {
  sessionId: string;
  questionId: string;
  choiceId: string | null;
  selfGrade: boolean | null;
  isCorrect: boolean;
}): Promise<SessionAnswer> {
  const { data, error } = await supabase
    .from("session_answers")
    .insert({
      session_id: args.sessionId,
      question_id: args.questionId,
      choice_id: args.choiceId,
      self_grade: args.selfGrade,
      is_correct: args.isCorrect,
    })
    .select("*")
    .single();
  if (error) throw error;
  return data as SessionAnswer;
}

export async function completeSession(args: {
  sessionId: string;
  score: number;
}): Promise<void> {
  const { error } = await supabase
    .from("sessions")
    .update({
      completed_at: new Date().toISOString(),
      score: args.score,
    })
    .eq("id", args.sessionId);
  if (error) throw error;
}

export type SessionWithAnswers = {
  session: Session;
  answers: SessionAnswer[];
  questions: Question[];
};

export async function fetchSessionWithAnswers(
  sessionId: string
): Promise<SessionWithAnswers> {
  const { data: session, error: sErr } = await supabase
    .from("sessions")
    .select("*")
    .eq("id", sessionId)
    .single();
  if (sErr) throw sErr;

  const { data: answers, error: aErr } = await supabase
    .from("session_answers")
    .select("*")
    .eq("session_id", sessionId)
    .order("answered_at", { ascending: true });
  if (aErr) throw aErr;

  const questionIds = (answers ?? []).map((a) => a.question_id);
  let questions: Question[] = [];
  if (questionIds.length > 0) {
    const { data: qs, error: qErr } = await supabase
      .from("questions")
      .select("*, choices:question_choices(*)")
      .in("id", questionIds);
    if (qErr) throw qErr;
    questions = (qs ?? []).map((q) => ({
      ...q,
      choices: (q.choices ?? []).sort(
        (a: { order_index: number }, b: { order_index: number }) =>
          a.order_index - b.order_index
      ),
    })) as Question[];
  }

  return {
    session: session as Session,
    answers: (answers ?? []) as SessionAnswer[],
    questions,
  };
}

export type LastScore = {
  moduleId: string;
  score: number;
  sessionSize: number;
  completedAt: string;
};

export async function fetchLastScoreByModule(): Promise<
  Record<string, LastScore>
> {
  const { data, error } = await supabase
    .from("sessions")
    .select("module_id, score, session_size, completed_at")
    .not("completed_at", "is", null)
    .order("completed_at", { ascending: false });
  if (error) throw error;
  const byModule: Record<string, LastScore> = {};
  for (const row of data ?? []) {
    if (byModule[row.module_id]) continue;
    byModule[row.module_id] = {
      moduleId: row.module_id,
      score: row.score ?? 0,
      sessionSize: row.session_size,
      completedAt: row.completed_at,
    };
  }
  return byModule;
}
