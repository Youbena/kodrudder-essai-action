-- Schéma de « Application de suivi de projets »
-- Extrait par Kodrudder des blocs SQL du dossier. Les corrections de la relecture (EC-xx) qui touchent
-- le schéma sont décrites dans le plan de développement : appliquez-les dans vos migrations.

CREATE TABLE project (
  id          INTEGER PRIMARY KEY,
  name        TEXT NOT NULL UNIQUE,   -- clé de rapprochement pour l'import (RM-07)
  created_at  TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE task (
  id          INTEGER PRIMARY KEY,
  -- RM-01 : une tâche appartient à un seul projet ; suppression en cascade (après confirmation côté UI)
  project_id  INTEGER NOT NULL REFERENCES project(id) ON DELETE CASCADE,
  -- RM-05 : titre non vide (espaces seuls rejetés), 200 caractères max
  title       TEXT NOT NULL CHECK (length(trim(title)) > 0 AND length(title) <= 200),
  -- RM-02 : statut initial À_FAIRE
  status      TEXT NOT NULL DEFAULT 'À_FAIRE'
              CHECK (status IN ('À_FAIRE','EN_COURS','TERMINÉ')),
  due_date    TEXT,                   -- ISO AAAA-MM-JJ, NULL = jamais en retard (RM-04)
  done_at     TEXT,                   -- RM-03 : effacée au retour depuis TERMINÉ
  created_at  TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CHECK ((status = 'TERMINÉ') OR done_at IS NULL),
  -- RM-08 : import idempotent (même titre + projet + échéance = doublon)
  UNIQUE (project_id, title, due_date)
);
-- NB : en SQLite, NULL ≠ NULL dans UNIQUE ; la déduplication des tâches sans échéance
-- est donc vérifiée par requête dans le service d'import (RM-08).
