# language: fr
Fonctionnalité: Application de suivi de projets

  Règle: RM-01 — Une tâche appartient à un seul projet

    @CA-01 @RM-01
    Scénario: CA-01 — Le projet et ses 2 tâches disparaissent
      Étant donné un projet de 2 tâches
      Quand je supprime le projet et confirme
      Alors le projet et ses 2 tâches disparaissent

  Règle: RM-02 — Statut initial d'une tâche

    @CA-02 @RM-02
    Scénario: CA-02 — Son statut est `À_FAIRE`
      Étant donné un projet existant
      Quand je crée une tâche sans statut
      Alors son statut est `À_FAIRE`

  Règle: RM-03 — Transitions libres entre statuts

    @CA-03 @RM-03
    Scénario: CA-03 — La date de fin est effacée
      Étant donné une tâche `TERMINÉ` avec date de fin
      Quand je la passe à `EN_COURS`
      Alors la date de fin est effacée

  Règle: RM-04 — Une tâche est en retard si échéance < aujourd'hui et statut ≠ `TERMINÉ`

    @CA-04 @RM-04
    Scénario: CA-04 — La tâche est marquée en retard
      Étant donné échéance hier, statut `EN_COURS`
      Quand j'ouvre la vue du jour
      Alors la tâche est marquée en retard

    @CA-05 @RM-04
    Scénario: CA-05 — La tâche n'est pas en retard
      Étant donné échéance aujourd'hui
      Quand j'ouvre la vue du jour
      Alors la tâche n'est pas en retard

  Règle: RM-05 — Titre obligatoire, 200 caractères max (H)

    @CA-06 @RM-05
    Scénario: CA-06 — Rejet avec message d'erreur
      Étant donné un titre composé d'espaces
      Quand je valide la création
      Alors rejet avec message d'erreur

  Règle: RM-06 — Avancement = tâches terminées / tâches totales

    @CA-07 @RM-06
    Scénario: CA-07 — L'avancement affiche 25 %
      Étant donné 1 tâche `TERMINÉ` sur 4
      Quand je consulte le projet
      Alors l'avancement affiche 25 %

  Règle: RM-07 — Import CSV : colonnes titre, projet, statut, échéance

    @CA-08 @RM-07
    Scénario: CA-08 — 2 tâches créées, 1 erreur listée
      Étant donné un CSV de 3 lignes dont 1 sans titre
      Quand j'importe
      Alors 2 tâches créées, 1 erreur listée

    @CA-10 @RM-07
    Scénario: CA-10 — Le projet est créé avec ses tâches
      Étant donné un CSV avec un projet inconnu
      Quand j'importe
      Alors le projet est créé avec ses tâches

  Règle: RM-08 — Import idempotent : même titre + projet + échéance = doublon ignoré

    @CA-09 @RM-08
    Scénario: CA-09 — Aucun doublon créé
      Étant donné un CSV déjà importé
      Quand je le réimporte
      Alors aucun doublon créé
