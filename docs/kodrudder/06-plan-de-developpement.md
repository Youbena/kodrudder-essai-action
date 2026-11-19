### Jalon 1 : Socle, projets et tâches (CA-01, CA-02, CA-03, CA-06, CA-07)

| ID | Objectif | Dépend de | CA couverts | Preuve de fin |
|---|---|---|---|---|
| T-01 | Initialiser Expo + TypeScript, Jest, ouverture `expo-sqlite` et migration du schéma (tables `project`, `task`, contraintes, `PRAGMA foreign_keys=ON`) | — | — | `npx expo start` démarre ; test Jest : le schéma se crée et la contrainte `CHECK` rejette un titre vide |
| T-02 | Service projets : `createProject`, `listProjects` (avancement RM-06), `deleteProject(id, confirmed)` avec cascade | T-01 | CA-01, CA-07 | Tests Jest : CA-01 (projet + 2 tâches supprimés), CA-07 (1/4 = 25 %), 0 % sans tâche |
| T-03 | Service tâches : `createTask` (défaut `À_FAIRE`, validation titre `TITLE_INVALID`), `updateTask` (gestion `done_at`), `deleteTask` | T-01 | CA-02, CA-03, CA-06 | Tests Jest : CA-02, CA-03, CA-06 (espaces seuls, 201 caractères) |
| T-04 | Écrans liste des projets (avancement), détail projet (liste des tâches, changement de statut) et formulaires de création/édition ; dialogue de confirmation avant suppression | T-02, T-03 | CA-01, CA-02, CA-03, CA-06, CA-07 | Test manuel sur simulateur : créer un projet, ajouter une tâche, la passer à `TERMINÉ` puis `EN_COURS`, supprimer le projet après confirmation |

### Jalon 2 : Échéances et retards (CA-04, CA-05)

| ID | Objectif | Dépend de | CA couverts | Preuve de fin |
|---|---|---|---|---|
| T-05 | `getToday()` : tâches du jour et en retard avec flag `overdue` (échéance < aujourd'hui, statut ≠ `TERMINÉ`, date locale) | T-03 | CA-04, CA-05 | Tests Jest : échéance hier + `EN_COURS` = en retard ; échéance aujourd'hui = non ; sans échéance = jamais |
| T-06 | Champ échéance (sélecteur de date) dans le formulaire de tâche, écran « Vue du jour » et marquage visuel des retards dans les listes | T-04, T-05 | CA-04, CA-05 | Test manuel : une tâche d'échéance hier apparaît marquée en retard dans la vue du jour |

### Jalon 3 : Import CSV, sauvegarde et finition (CA-08, CA-09, CA-10)

| ID | Objectif | Dépend de | CA couverts | Preuve de fin |
|---|---|---|---|---|
| T-07 | Service `importCsv` : parsing `papaparse`, validation par ligne, projet inconnu créé, statut absent = `À_FAIRE`, déduplication par requête (y compris échéance NULL), une seule transaction, rapport `{created, ignored, errors}` | T-02, T-03 | CA-08, CA-09, CA-10 | Tests Jest sur fixtures CSV : CA-08 (2 créées, 1 erreur), CA-09 (réimport sans doublon), CA-10 (projet créé) |
| T-08 | Écran d'import : `expo-document-picker`, appel `importCsv`, affichage du rapport (créées, ignorées, erreurs par ligne) | T-04, T-07 | CA-08, CA-09, CA-10 | Test manuel : importer un CSV de 3 lignes dont 1 sans titre ; le rapport affiche 2 créées, 1 erreur |
| T-09 | `exportBackup()` : export du fichier SQLite via la feuille de partage système ; message d'erreur en cas d'échec | T-01 | — | Test manuel sur appareil : le fichier `.sqlite` est partagé et s'ouvre avec un lecteur SQLite |
| T-10 | Parcours hors ligne et finition : mode avion de bout en bout, navigation (projets, vue du jour, import), messages d'erreur homogènes | T-06, T-08, T-09 | CA-01 à CA-10 | `npx jest` vert ; parcours complet en mode avion sur simulateur Android ou iOS |
