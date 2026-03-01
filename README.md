# 📘 Guía Completa: Antigravity Project Template

> Guía paso a paso para configurar y aprovechar al máximo este template con **Google Antigravity**, el IDE agéntico de Google powered by Gemini 3.

---

## ¿Qué es Google Antigravity?

Antes de entrar en el template, conviene entender con qué herramienta trabajas.

Google Antigravity es un IDE agente-first lanzado en noviembre de 2025. A diferencia de herramientas como Cursor o GitHub Copilot, que básicamente completan código, **Antigravity despliega agentes autónomos** que pueden planificar tareas complejas, ejecutar comandos en la terminal, navegar el navegador y verificar resultados, todo sin intervención humana paso a paso.

Tiene dos modos principales:

- **Editor View**: el IDE clásico (fork de VS Code) para trabajo manos a la obra
- **Manager View**: panel de control tipo Mission Control donde puedes lanzar varios agentes en paralelo, cada uno con su tarea, estado y Artifacts

Los **Artifacts** son el mecanismo de trazabilidad: documentos verificables (planes, diffs, capturas) que el agente genera en cada paso para que puedas revisar exactamente qué hizo y por qué.

---

## ¿Para qué sirve este template?

Antigravity es potente, pero sin contexto de tu proyecto, el agente empieza desde cero en cada sesión. Este template resuelve eso:

- **`ANTIGRAVITY.md`**: el archivo que Antigravity lee automáticamente al abrir tu proyecto. Define el stack, los comandos, las convenciones y el "ADN" del proyecto.
- **Skills**: instrucciones especializadas para que el agente se comporte como un experto en *tu* proyecto concreto, no como un generalista.
- **5 workflows** (slash commands): automatizan las tareas de documentación más repetitivas.
- **Docs estructurados**: `LOGS.md`, `CHANGELOG.md` y `MANUAL.md` siempre al día sin esfuerzo manual.
- **Script `init.ps1`**: configura todo en segundos.

---

## Estructura del proyecto resultante

```
tu-proyecto/
├── ANTIGRAVITY.md                     ← Leído automáticamente por el agente
├── .agentignore                       ← Archivos que el agente ignorará
├── .agent/
│   ├── workflows/                     ← Slash commands personalizados
│   │   ├── log-session.md             ← /log-session
│   │   ├── update-changelog.md        ← /update-changelog
│   │   ├── document-feature.md        ← /document-feature
│   │   ├── session-summary.md         ← /session-summary
│   │   └── new-version.md            ← /new-version
│   └── skills/
│       └── core/
│           └── SKILL.md              ← ADN y reglas del proyecto para el agente
├── docs/
│   ├── LOGS.md                        ← Diario de sesiones de trabajo
│   ├── CHANGELOG.md                   ← Historial de cambios versionados
│   └── MANUAL.md                      ← Documentación técnica del proyecto
├── .github/
│   └── ISSUE_TEMPLATE/               ← Templates para issues de GitHub
├── init.ps1                           ← Script de inicialización automática
└── .gitignore
```

---

## Instalación

### Opción A — Script automático (recomendado)

Clona el template y ejecuta el script de inicialización desde PowerShell en la raíz de tu proyecto:

```powershell
# Clona el template
git clone https://github.com/Deibiz4/antigravity-template.git

# Ve a la carpeta de tu proyecto
cd tu-proyecto

# Ejecuta el script
../antigravity-template/init.ps1
```

El script crea todas las carpetas necesarias, copia los archivos y deja el proyecto listo para empezar.

### Opción B — Instalación manual

Si prefieres hacerlo paso a paso:

```bash
# 1. Crea la estructura de carpetas
mkdir -p .agent/workflows .agent/skills/core docs

# 2. Copia los workflows
cp antigravity-template/.agent/workflows/* .agent/workflows/

# 3. Copia el skill base
cp antigravity-template/.agent/skills/core/SKILL.md .agent/skills/core/

# 4. Copia los archivos de configuración
cp antigravity-template/ANTIGRAVITY.md.template ANTIGRAVITY.md
cp antigravity-template/.agentignore.template .agentignore

# 5. Copia los templates de documentación
cp antigravity-template/LOGS.md.template docs/LOGS.md
cp antigravity-template/CHANGELOG.md.template docs/CHANGELOG.md
cp antigravity-template/MANUAL.md.template docs/MANUAL.md
```

---

## Configuración tras la instalación

### 1. Personaliza `ANTIGRAVITY.md`

Este es el archivo más importante. Es lo primero que lee el agente al abrir tu proyecto. Edita los campos marcados con `[REEMPLAZAR]`:

```markdown
# Proyecto: [REEMPLAZAR → ej: "API de pagos con Stripe"]

## Stack tecnológico
- Lenguaje: [REEMPLAZAR → ej: TypeScript 5 / Node.js 22]
- Framework: [REEMPLAZAR → ej: Fastify 4]
- Base de datos: [REEMPLAZAR → ej: PostgreSQL 16 + Drizzle ORM]
- Infra: [REEMPLAZAR → ej: Docker + Railway]

## Comandos principales
- Dev: [REEMPLAZAR → ej: npm run dev]
- Build: [REEMPLAZAR → ej: npm run build]
- Tests: [REEMPLAZAR → ej: npm test]
- Lint: [REEMPLAZAR → ej: npm run lint]

## Variables de entorno clave
- [REEMPLAZAR → ej: DATABASE_URL, STRIPE_SECRET_KEY, JWT_SECRET]

## Convenciones del proyecto
- [REEMPLAZAR → ej: commits en inglés, formato Conventional Commits]
- [REEMPLAZAR → ej: tests obligatorios para cada endpoint nuevo]
```

Cuanto más detallado lo dejes, mejores serán las decisiones autónomas del agente.

### 2. Edita el `SKILL.md` del agente

El archivo `.agent/skills/core/SKILL.md` convierte al agente generalista en un especialista de tu proyecto. Aquí defines:

- Patrones de código que debe seguir
- Qué hacer y qué evitar al generar código
- Estilo de naming, estructura de carpetas, etc.

Ejemplo:

```markdown
# Core Skill: mi-api-pagos

## Reglas de código
- Siempre usar async/await, nunca callbacks
- Los handlers de Fastify deben validar con Zod antes de procesar
- Todos los errores deben loguearse con el logger de Pino

## Estructura de archivos
- Rutas en /src/routes/
- Lógica de negocio en /src/services/
- Tipos compartidos en /src/types/

## Tests
- Usar Vitest para unit tests
- Cada servicio nuevo necesita al menos test del happy path y del error path
```

### 3. Ajusta `.agentignore`

Similar a `.gitignore`. Excluye archivos que no quieres que el agente indexe:

```
node_modules/
dist/
.env
*.log
coverage/
.cache/
```

---

## Los 5 Workflows: cuándo y cómo usarlos

Los workflows son archivos `.md` en `.agent/workflows/` que defines en lenguaje natural y ejecutas como slash commands directamente en el chat de Antigravity.

### `/log-session`
**Cuándo:** Al terminar cada sesión de trabajo.

Genera una entrada en `docs/LOGS.md` con resumen de la sesión, archivos modificados y decisiones técnicas. Da trazabilidad total al desarrollo.

```
# En Antigravity chat:
/log-session
```

---

### `/update-changelog`
**Cuándo:** Tras completar algo que merezca quedar en el historial (feature nueva, bugfix, refactor relevante).

Añade una entrada estructurada en `docs/CHANGELOG.md` siguiendo el formato [Keep a Changelog](https://keepachangelog.com/).

```
/update-changelog
```

---

### `/document-feature`
**Cuándo:** Después de implementar funcionalidad nueva.

Actualiza `docs/MANUAL.md` con descripción de la feature: qué hace, cómo se usa, parámetros, ejemplos. El agente analiza el código que acaba de escribir y redacta la documentación solo.

```
/document-feature
```

---

### `/session-summary`
**Cuándo:** Antes de cerrar Antigravity o para una revisión rápida de lo hecho.

Muestra en el chat un resumen ejecutivo de la sesión: cambios, archivos tocados y próximos pasos sugeridos.

```
/session-summary
```

---

### `/new-version`
**Cuándo:** Al preparar un release.

Consolida el CHANGELOG desde la última versión, actualiza el número de versión y genera release notes listas para publicar.

```
/new-version
```

---

## Flujo de trabajo recomendado

```
Abres Antigravity y seleccionas tu proyecto
              │
              ▼
El agente lee ANTIGRAVITY.md + SKILL.md automáticamente
(entiende tu stack, convenciones y contexto)
              │
              ▼
Usas Manager View o Editor View según la tarea:
  - Tarea grande y autónoma → Manager View (Plan Mode)
  - Ajuste rápido o revisión → Editor View (Fast Mode)
              │
              ▼
El agente ejecuta, genera Artifacts y te los presenta para revisión
              │
              ▼
Apruebas o corriges → el agente itera
              │
              ▼
Al terminar algo documentable → /document-feature
Al hacer cambio versionable → /update-changelog
              │
              ▼
Al cerrar la sesión → /log-session
              │
              ▼
Al preparar release → /new-version
```

---

## Casos de uso reales

### 🔧 Caso 1: Scaffolding de proyecto nuevo desde cero

Acabas de crear un repositorio vacío para una app en Next.js + Supabase. Quieres que el agente construya la estructura base.

**Sin el template:**
El agente no sabe tu stack, tus convenciones ni cómo organizas el código. Lo genera genérico y tienes que corregirlo todo.

**Con el template:**
```
# 1. Aplicas el template e inicializas
./init.ps1

# 2. Rellenas ANTIGRAVITY.md:
#    Stack: Next.js 15, TypeScript, Tailwind, Supabase
#    Dev: npm run dev | Build: npm run build
#    Auth con Supabase, db schema en /supabase/migrations

# 3. En Manager View de Antigravity (Plan Mode):
"Scaffolding completo del proyecto: estructura de carpetas, 
 layout base, configuración de Supabase y página de login"
```

El agente crea la estructura, escribe los archivos, lanza el servidor, abre Chrome y verifica que la página de login carga. Te entrega un Artifact con capturas de pantalla como prueba.

---

### 🐛 Caso 2: Debugging autónomo con Browser Agent

Tu API falla en producción. El error es intermitente y difícil de reproducir.

```
# En Manager View:
"El endpoint /api/payments retorna 500 de forma intermitente. 
 Analiza los logs en docs/LOGS.md, reproduce el error en local 
 y propón un fix con tests que lo cubran."
```

El agente analiza los logs, detecta el patrón, reproduce el error en la terminal, escribe el fix, ejecuta los tests para verificarlo y te presenta el diff con explicación. Tú revisas y apruebas.

---

### 📦 Caso 3: Mantenimiento de API con equipo

Llevas meses en una API con varios devs. La documentación siempre queda desactualizada.

**Flujo con el template:**

```
Dev A añade endpoint /users/export:
→ /document-feature   → MANUAL.md actualizado
→ /update-changelog   → CHANGELOG.md con la nueva feature
→ /log-session        → LOGS.md con lo hecho en la sesión

Dev B hace fix de seguridad en /auth/login:
→ /update-changelog   → CHANGELOG.md con el bugfix
→ /log-session        → decisión técnica registrada en LOGS.md
```

El repo siempre refleja el estado real del proyecto. Cualquier nuevo dev (o el agente en una nueva sesión) tiene contexto inmediato.

---

### 🚀 Caso 4: Release de versión

Terminas el sprint y quieres publicar la `v2.1.0`.

```
# Durante el sprint usaste /update-changelog con cada cambio.
# Ahora, antes del tag de git:

/new-version

# El agente:
# 1. Recoge todos los cambios desde v2.0.0
# 2. Los organiza en Added / Changed / Fixed / Security
# 3. Genera las release notes
# 4. Actualiza package.json con el nuevo número de versión
```

---

### 👥 Caso 5: Onboarding de nuevo desarrollador

Un dev nuevo se une al equipo. En lugar de una reunión de onboarding de 2 horas:

```
# El dev abre Antigravity en el proyecto
# El agente ya tiene todo el contexto en:
# - ANTIGRAVITY.md  → stack y comandos
# - SKILL.md        → convenciones y patrones
# - docs/MANUAL.md  → documentación técnica actualizada
# - docs/LOGS.md    → historial de decisiones técnicas

# Primera tarea del nuevo dev:
"Explícame la arquitectura del proyecto y dame una tarea 
 de complejidad baja para empezar"
```

El agente lee todos los documentos y onboardea al dev con contexto real y actualizado.

---

## Aprovechar las features de Antigravity con el template

### Plan Mode vs Fast Mode

Elige según la complejidad de la tarea:

| Situación | Modo recomendado |
|-----------|-----------------|
| Feature nueva compleja | Plan Mode — el agente crea un Artifact con el plan antes de actuar |
| Bugfix conocido | Fast Mode — ejecución directa sin plan previo |
| Refactor de múltiples archivos | Plan Mode — puedes revisar y ajustar antes de confirmar |
| Cambio de una línea | Fast Mode |

### Terminal Policy

Configura en Antigravity Settings cuánta autonomía le das al agente en la terminal. Para proyectos con este template, lo recomendable es **Agent Decides**: el agente ejecuta comandos seguros sin preguntar, pero pide confirmación para comandos destructivos (drops de BD, borrado de archivos, deploys).

### Browser Agent

Con el `ANTIGRAVITY.md` bien configurado (incluyendo la URL local de tu app), el Browser Agent puede:
- Lanzar la app automáticamente tras un cambio
- Verificar en Chrome que la feature funciona visualmente
- Generar capturas de pantalla como Artifact de verificación

---

## Crear workflows propios

Los workflows son archivos `.md` con instrucciones en lenguaje natural. Puedes crear los tuyos:

```bash
touch .agent/workflows/mi-workflow.md
```

Ejemplo de workflow personalizado para generar tests automáticamente:

```markdown
# Workflow: generate-tests

Cuando ejecuto /generate-tests:
1. Analiza los archivos modificados en la última sesión (revisa docs/LOGS.md)
2. Identifica funciones y endpoints sin cobertura de tests
3. Genera tests unitarios con Vitest para cada uno
4. Ejecuta npm test y verifica que pasan
5. Reporta el resultado en el chat
```

---

## Preguntas frecuentes

**¿El template funciona con todos los modelos de Antigravity?**
Sí. El `ANTIGRAVITY.md` y los skills son agnósticos al modelo. Funcionan igual con Gemini 3 Pro, Claude Sonnet 4.6 o GPT-OSS.

**¿Subo el template al repositorio?**
Sí y es muy recomendable. `ANTIGRAVITY.md`, `.agent/` y `docs/` deben estar en el repo para que todo el equipo y el agente tengan el mismo contexto. Solo excluye `.env` y archivos sensibles con `.agentignore`.

**¿En qué se diferencia del `CLAUDE.md` para Claude Code?**
La función es la misma (dar contexto al agente al arrancar), pero el formato está adaptado a Antigravity. Los skills en `.agent/skills/` son el equivalente al `CLAUDE.md`, pero más granulares: puedes tener varios skills para distintos aspectos del proyecto.

**¿Puedo usar el template en un proyecto que ya existe?**
Sí. Copia los archivos a tu proyecto existente. El `ANTIGRAVITY.md` no toca tu código, y los `docs/` se crean en una carpeta separada.

**¿Necesito PowerShell para usar el script init.ps1?**
En Windows sí. En Mac o Linux puedes usar PowerShell 7 (disponible para ambos) o hacer la instalación manual con los comandos de la Opción B.

**¿Cuánto contexto lee el agente de los docs?**
Antigravity indexa el proyecto completo incluyendo `docs/`. Cuanto más actualizado esté el `MANUAL.md` y los `LOGS.md`, mejores decisiones tomará el agente en sesiones futuras.

---

## Contribuir

¿Tienes un workflow útil? ¿Mejoras para el SKILL base o el ANTIGRAVITY.md?

1. Haz fork del repositorio
2. Crea una rama (`git checkout -b feature/mi-mejora`)
3. Haz commit de tus cambios
4. Abre un Pull Request

Puedes usar los issue templates de `.github/ISSUE_TEMPLATE/` para reportar bugs o proponer features.

---

*Template por [@Deibiz4](https://github.com/Deibiz4) · Diseñado para [Google Antigravity](https://antigravity.google)*
