// T-03 — Service tâches : createTask, updateTask, deleteTask (CA-02, CA-03, CA-06)
export type Status = "À_FAIRE" | "EN_COURS" | "TERMINÉ";
export interface Task { id: number; projectId: number; title: string; status: Status; dueDate: string | null; doneAt: string | null }

export class TaskError extends Error {
  constructor(public code: "TITLE_INVALID") { super(code); }
}

/** RM-05 : titre obligatoire, 200 caractères maximum, espaces seuls refusés. */
export function validateTitle(title: string): string {
  const t = title.trim();
  if (!t || t.length > 200) throw new TaskError("TITLE_INVALID");
  return t;
}

let nextId = 1;
const tasks = new Map<number, Task>();

/** RM-01 : une tâche appartient à un seul projet ; RM-02 : statut initial À_FAIRE. */
export function createTask(projectId: number, title: string, dueDate: string | null = null): Task {
  const task: Task = { id: nextId++, projectId, title: validateTitle(title), status: "À_FAIRE", dueDate, doneAt: null };
  tasks.set(task.id, task);
  return task;
}

/** RM-03 : transitions libres ; done_at renseigné au passage à TERMINÉ, effacé sinon. */
export function updateTask(id: number, patch: Partial<Pick<Task, "title" | "status" | "dueDate">>): Task {
  const task = tasks.get(id);
  if (!task) throw new Error("NOT_FOUND");
  if (patch.title !== undefined) task.title = validateTitle(patch.title);
  if (patch.dueDate !== undefined) task.dueDate = patch.dueDate;
  if (patch.status !== undefined) {
    task.status = patch.status;
    task.doneAt = patch.status === "TERMINÉ" ? new Date().toISOString() : null;
  }
  return task;
}

export function deleteTask(id: number): boolean {
  return tasks.delete(id);
}
