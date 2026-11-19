### Besoins

| ID | Besoin | Source |
|---|---|---|
| BE-01 | Créer et gérer des projets | D-02 |
| BE-02 | Gérer les tâches d'un projet avec statut | D-02 |
| BE-03 | Définir des échéances et repérer les retards | D-02 |
| BE-04 | Importer des données existantes | D-04, D-06 |
| BE-05 | Utiliser l'application sur mobile, hors ligne | D-03, D-07 |
| BE-06 | Suivre l'avancement d'un projet | D-02 (H) |

### Règles métier

| ID | Règle | Défaut | Cas limite |
|---|---|---|---|
| RM-01 | Une tâche appartient à un seul projet | Obligatoire | Suppression du projet : tâches supprimées après confirmation |
| RM-02 | Statut initial d'une tâche | `À_FAIRE` | Import sans statut : `À_FAIRE` |
| RM-03 | Transitions libres entre statuts | Autorisées | Retour depuis `TERMINÉ` : autorisé et efface la date de fin |
| RM-04 | Une tâche est en retard si échéance < aujourd'hui et statut ≠ `TERMINÉ` | Pas d'échéance : jamais en retard | Échéance = aujourd'hui : pas en retard |
| RM-05 | Titre obligatoire, 200 caractères max (H) | Rejet si vide | Espaces seuls : rejet |
| RM-06 | Avancement = tâches terminées / tâches totales | 0 % | Aucune tâche : 0 % |
| RM-07 | Import CSV : colonnes titre, projet, statut, échéance | Projet inconnu créé | Ligne invalide ignorée et listée dans le rapport |
| RM-08 | Import idempotent : même titre + projet + échéance = doublon ignoré | Doublon ignoré | Titre identique, échéance différente : créé |

### Statuts

`À_FAIRE`, `EN_COURS`, `TERMINÉ`

### Critères d'acceptation

| ID | Étant donné | Quand | Alors | RM |
|---|---|---|---|---|
| CA-01 | Un projet de 2 tâches | Je supprime le projet et confirme | Le projet et ses 2 tâches disparaissent | RM-01 |
| CA-02 | Un projet existant | Je crée une tâche sans statut | Son statut est `À_FAIRE` | RM-02 |
| CA-03 | Une tâche `TERMINÉ` avec date de fin | Je la passe à `EN_COURS` | La date de fin est effacée | RM-03 |
| CA-04 | Échéance hier, statut `EN_COURS` | J'ouvre la vue du jour | La tâche est marquée en retard | RM-04 |
| CA-05 | Échéance aujourd'hui | J'ouvre la vue du jour | La tâche n'est pas en retard | RM-04 |
| CA-06 | Un titre composé d'espaces | Je valide la création | Rejet avec message d'erreur | RM-05 |
| CA-07 | 1 tâche `TERMINÉ` sur 4 | Je consulte le projet | L'avancement affiche 25 % | RM-06 |
| CA-08 | Un CSV de 3 lignes dont 1 sans titre | J'importe | 2 tâches créées, 1 erreur listée | RM-07 |
| CA-09 | Un CSV déjà importé | Je le réimporte | Aucun doublon créé | RM-08 |
| CA-10 | Un CSV avec un projet inconnu | J'importe | Le projet est créé avec ses tâches | RM-07 |
