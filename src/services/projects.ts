// T-02 — Service projets : createProject, listProjects (avancement RM-06), deleteProject avec cascade (CA-01, CA-07)
export interface Project { id: number; title: string; done: number; total: number }

export function progress(p: Pick<Project, "done" | "total">): number {
  // RM-06 : avancement = tâches terminées / tâches totales ; 0 % sans tâche.
  return p.total === 0 ? 0 : Math.round((p.done / p.total) * 100);
}
