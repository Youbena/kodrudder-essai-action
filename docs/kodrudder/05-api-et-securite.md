### API (couche service locale)

Pas d'API réseau : ces fonctions TypeScript sont appelées par l'UI et lisent ou écrivent SQLite. Rôle unique : utilisateur local (D-01).

| Fonction | Entrée → sortie | Erreurs | RM / CA |
|---|---|---|---|
| `createProject(name)` | nom → projet | nom vide ou déjà existant | BE-01 |
| `deleteProject(id, confirmed)` | id, confirmation → void | refus si `confirmed=false` | RM-01, CA-01 |
| `listProjects()` | ∅ → projets + avancement % | — | RM-06, CA-07 |
| `createTask(projectId, title, status?, due?)` | → tâche (statut `À_FAIRE` par défaut) | `TITLE_INVALID` (vide, espaces, >200) | RM-02, RM-05, CA-02, CA-06 |
| `updateTask(id, patch)` | champs modifiés → tâche | `TITLE_INVALID`, `NOT_FOUND` ; passage à `TERMINÉ` : `done_at` = now ; sortie de `TERMINÉ` : `done_at` = NULL | RM-03, CA-03 |
| `deleteTask(id)` | id → void | `NOT_FOUND` | BE-02 |
| `getToday()` | ∅ → tâches du jour et en retard, flag `overdue` | — | RM-04, CA-04, CA-05 |
| `importCsv(fileUri)` | CSV (titre, projet, statut, échéance) → rapport `{created, ignored, errors[ligne, motif]}` | fichier illisible ; ligne invalide ignorée et listée | RM-07, RM-08, CA-08, CA-09, CA-10 |
| `exportBackup()` | ∅ → fichier SQLite partagé | échec d'écriture | D-07 |

Règles d'import : statut absent → `À_FAIRE` ; projet inconnu → créé ; import en une transaction (échec global = aucune écriture partielle) (H).

### Intégrations externes

| Service | Usage | Repli |
|---|---|---|
| Sélecteur de fichiers système | Choisir le CSV à importer | Message d'erreur, aucune donnée modifiée |
| Feuille de partage système | Enregistrer la sauvegarde (Drive, iCloud, fichiers…) | Sauvegarde reportée, l'application reste fonctionnelle |

Aucune API Trello/Notion dans le MVP (D-06).

### Sécurité et données personnelles

- Aucune donnée sensible : pas de chiffrement dédié (D-05), seule la protection native du téléphone s'applique.
- Aucun serveur, compte ni télémétrie : les données ne quittent pas l'appareil, sauf sauvegarde déclenchée par l'utilisateur.
- Requêtes SQL paramétrées uniquement ; CSV traité comme entrée non fiable (limite de taille et de lignes, encodage UTF-8) (H).
- Le fichier de sauvegarde n'est pas chiffré : l'utilisateur choisit sa destination (H).
