---
description: Prepara un release de nueva versión.
---

1. Lee `docs/CHANGELOG.md` para ver la versión actual.
2. Lee `docs/LOGS.md` para identificar cambios desde el último release.
3. Determina el tipo de versión: PATCH, MINOR o MAJOR.
4. Actualiza `docs/CHANGELOG.md`:
   - Mueve los items de `[Unreleased]` a la nueva versión con fecha de hoy.
   - Deja `[Unreleased]` vacío.
5. Muestra el comando de git tag sugerido:
   ```bash
   git tag -a vX.Y.Z -m "Release vX.Y.Z"
   ```

No ejecutes comandos de git directamente. Solo actualiza el CHANGELOG y muestra las instrucciones.
