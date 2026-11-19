@AGENTS.md

## Propre à Claude Code
- Le détail du dossier n'est pas importé ici pour ne pas charger le contexte : ouvrez le fichier de `docs/kodrudder/` utile à la tâche en cours.
- Pour une tâche qui touche plusieurs fichiers, commencez en mode plan et citez les CA-xx visés (`docs/kodrudder/06-plan-de-developpement.md`).
- Si le serveur MCP `kodrudder` est connecté : `get_next_task` pour savoir quoi faire, `update_task_status` quand la preuve de fin passe, `report_drift` dès que le code s'écarte du dossier.
- Ne modifiez pas les fichiers de `docs/kodrudder/` à la main sans le signaler : ils sont régénérés par `kodrudder pull`.
