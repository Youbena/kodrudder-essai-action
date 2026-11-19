### Le produit

Application mobile personnelle (Expo, TypeScript, SQLite local) de suivi opérationnel : projets, tâches, échéances, statuts `À_FAIRE` / `EN_COURS` / `TERMINÉ`. Mono-utilisateur, hors ligne, avec reprise de données existantes par import CSV.

### Ce qui est décidé

- Outil personnel : ni comptes, ni partage (D-01).
- Application mobile, stockage local SQLite sans serveur (D-03, D-07 en H).
- Reprise de données par import CSV, sans API en direct (D-04, D-06 en H).
- MVP : CRUD projets/tâches, statuts, échéances, vue du jour et retards, import CSV, hors ligne.
- Hors périmètre : partage, Gantt, finances, version web.

### Ce qui reste une hypothèse à vérifier avant de coder

- **(H) D-06** : l'export CSV de ton outil actuel (Trello, Notion, tableur) existe et ses colonnes sont connues. Valide-le sur un vrai fichier avant T-07.
- **(H) D-07** : le stockage local sans compte te convient. Un téléphone perdu n'a de sauvegarde que celle prévue au jalon 3.
- **(H)** Les seuils de succès (vue en moins de 10 s, tâche en moins de 3 touches) n'ont pas été validés.

### Corrections de la relecture

Aucun écart EC-xx : la relecture en profondeur n'a pas été réalisée (mode Rapide), seuls les contrôles automatiques sont passés.

### Comment utiliser ce dossier

1. Donne à l'outil de codage la section Cadrage, puis les règles et critères d'acceptation (RM-xx, CA-xx).
2. Fais-lui exécuter les jalons dans l'ordre : un jalon à la fois, T-01 à T-08.
3. Valide chaque tâche par sa « preuve de fin » (tests Jest ou test manuel) avant de passer à la suivante.
