-- T-01 — schéma initial : tables `project` et `task`, contraintes (RM-01, RM-05)
PRAGMA foreign_keys = ON;

CREATE TABLE project (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL CHECK (length(trim(title)) BETWEEN 1 AND 200)
);

CREATE TABLE task (
  id INTEGER PRIMARY KEY,
  project_id INTEGER NOT NULL REFERENCES project(id) ON DELETE CASCADE,
  title TEXT NOT NULL CHECK (length(trim(title)) BETWEEN 1 AND 200),
  status TEXT NOT NULL DEFAULT 'À_FAIRE' CHECK (status IN ('À_FAIRE', 'EN_COURS', 'TERMINÉ')),
  due_date TEXT,
  done_at TEXT
);
