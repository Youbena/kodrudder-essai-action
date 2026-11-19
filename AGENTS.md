# AGENTS.md — Application de suivi de projets

> Généré par Kodrudder à partir du dossier « Application de suivi de projets ». Ce fichier est un index : le détail est dans `docs/kodrudder/`.

## But
Application mobile personnelle (Expo, TypeScript, SQLite local) de suivi opérationnel : projets, tâches, échéances, statuts `À_FAIRE` / `EN_COURS` / `TERMINÉ`. Mono-utilisateur, hors ligne, avec reprise de données existantes par import CSV.

## Pile technique
- **Application** : React Native (Expo) + TypeScript (H)
- **Stockage** : SQLite local (`expo-sqlite`)
- **Import CSV** : `papaparse` + `expo-document-picker`
- **Sauvegarde** : Export du fichier SQLite via la feuille de partage système (H)
- **Backend** : Aucun

## Commandes
- `npx expo start`
- `npx jest`

## Conventions
- Tout identifiant du dossier (RM-xx, CA-xx, T-xx, EC-xx, D-xx) se cite tel quel dans les messages de commit et les noms de tests.
- Une information marquée (H) est une hypothèse : ne pas la traiter comme un fait, la rendre configurable ou demander confirmation.

## Règles à ne pas enfreindre
- **RM-01** — Une tâche appartient à un seul projet _(Obligatoire)_
- **RM-02** — Statut initial d'une tâche _(`À_FAIRE`)_
- **RM-03** — Transitions libres entre statuts _(Autorisées)_
- **RM-04** — Une tâche est en retard si échéance < aujourd'hui et statut ≠ `TERMINÉ` _(Pas d'échéance : jamais en retard)_
- **RM-05** — Titre obligatoire, 200 caractères max (H) _(Rejet si vide)_
- **RM-06** — Avancement = tâches terminées / tâches totales _(0 %)_
- **RM-07** — Import CSV : colonnes titre, projet, statut, échéance _(Projet inconnu créé)_
- **RM-08** — Import idempotent : même titre + projet + échéance = doublon ignoré _(Doublon ignoré)_

## Ordre de travail
1. Lire `docs/kodrudder/00-a-lire-dabord.md` : ce qui est décidé, ce qui reste une hypothèse (H), les corrections de la relecture.
2. Suivre le plan (`docs/kodrudder/06-plan-de-developpement.md`) jalon par jalon : J0 (T-01 → T-04), J1 (T-05 → T-06), J2 (T-07 → T-10). Ne pas sauter de jalon.
3. Une tâche T-xx à la fois, dépendances d'abord (`docs/kodrudder/tasks.json`). Avant de coder : relire les critères CA-xx et les règles RM-xx de la tâche.
4. Une tâche est finie quand sa « preuve de fin » passe (tests, services externes simulés). Sans preuve, elle n'est pas finie.

## Où trouver quoi
| Sujet | Fichier |
|---|---|
| À lire d'abord | `docs/kodrudder/00-a-lire-dabord.md` |
| Cadrage | `docs/kodrudder/01-cadrage.md` |
| Règles métier et critères d'acceptation | `docs/kodrudder/02-regles-et-criteres.md` |
| Parcours et écrans | `docs/kodrudder/03-parcours-et-ecrans.md` |
| Architecture et données | `docs/kodrudder/04-architecture-et-donnees.md` |
| API, intégrations et sécurité | `docs/kodrudder/05-api-et-securite.md` |
| Plan de développement | `docs/kodrudder/06-plan-de-developpement.md` |
| Relecture indépendante | `docs/kodrudder/07-relecture.md` |
| Tâches structurées (dépendances, critères, preuve de fin) | `docs/kodrudder/tasks.json` |
| Schéma SQL exécutable | `docs/kodrudder/schema.sql` |
| Critères d'acceptation en Gherkin | `docs/kodrudder/acceptance.feature` |
| Journal des décisions (fait, hypothèse, choix de l'utilisateur) | `docs/kodrudder/decisions.md` |
| Sources consultées | `docs/kodrudder/sources.md` |

## Si le code s'écarte du dossier
Ne pas diverger en silence. Si une règle, un critère ou le schéma ne peut pas être respecté tel qu'écrit : s'arrêter, expliquer l'écart et proposer la modification de la section concernée. Avec le serveur MCP Kodrudder connecté : `report_drift` pour signaler, `update_section` pour proposer la nouvelle version.
