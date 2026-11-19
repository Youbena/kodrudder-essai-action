# Cadrage

**Produit** : application mobile personnelle de suivi opérationnel de projets (tâches, échéances, statuts). Mono-utilisateur, avec reprise des données existantes.

| Utilisateur | Résultat attendu |
|---|---|
| Moi seul(e), sur téléphone | Voir en moins de 10 s ce qui est à faire, en retard ou terminé (H) |
| Moi seul(e), à la migration | Importer mes données existantes sans ressaisie |

### Décisions tranchées

| ID | Question | Décision retenue | Source |
|---|---|---|---|
| D-01 | Public | Outil personnel, sans partage ni comptes multiples | Utilisateur |
| D-02 | Type de suivi | Opérationnel : listes de tâches, échéances, statuts À FAIRE / EN COURS / TERMINÉ | Utilisateur |
| D-03 | Support | Application mobile en priorité | Utilisateur |
| D-04 | Données existantes | Reprise des données existantes ou connexion à un outil actuel | Utilisateur |
| D-05 | Sensibilité | Aucune donnée sensible, pas de chiffrement spécifique | Utilisateur |
| D-06 | Méthode de reprise | Import CSV (export Trello/Notion/tableur) ; pas de connexion API en direct dans le MVP | H |
| D-07 | Stockage | Local sur le téléphone avec sauvegarde simple, sans compte ni serveur | H |

### Périmètre MVP

- MVP-01 : CRUD projets et tâches
- MVP-02 : statuts et échéances
- MVP-03 : vue « À faire aujourd'hui / en retard »
- MVP-04 : import CSV
- MVP-05 : mode hors ligne

**Hors périmètre** : partage, collaboration, diagrammes de Gantt, finances, synchronisation API en direct, version web.

### Mesures de succès

- Import de 100 % des lignes valides d'un CSV de test
- Création d'une tâche en moins de 3 touches (H)
- Utilisation quotidienne pendant 4 semaines (H)
