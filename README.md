# 🛸 Antigravity Project Template

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Antigravity](https://img.shields.io/badge/Powered%20by-Antigravity-blueviolet)](https://antigravity.google)

Una plantilla premium para configurar proyectos nuevos con **Antigravity**. Diseñada para estandarizar la documentación, optimizar el flujo de trabajo y mantener un registro impecable de cada sesión de desarrollo.

---

## ✨ Características Principales

- **🤖 Automatización Nativa**: Workflows listos para usar como slash commands.
- **📚 Gestión de Documentación**: Estructura organizada para Logs, Changelog y Manuales.
- **🧠 Core Skill**: Define el comportamiento de la IA específicamente para tu proyecto.
- **🚀 Instalación Rápida**: Script de inicialización incluido.

## 📂 Estructura del Proyecto

Una vez configurado, tu proyecto tendrá esta estructura:

```text
tu-proyecto/
├── .agent/
│   ├── workflows/             # Slash commands personalizados
│   │   ├── log-session.md     # /log-session
│   │   ├── update-changelog.md # /update-changelog
│   │   ├── document-feature.md # /document-feature
│   │   ├── session-summary.md  # /session-summary
│   │   └── new-version.md      # /new-version
│   └── skills/
│       └── core/
│           └── SKILL.md       # ADN y reglas del proyecto
├── docs/                      # Documentación viva
│   ├── LOGS.md                # Diario de desarrollo
│   ├── CHANGELOG.md           # Historial de cambios
│   └── MANUAL.md              # Documentación técnica
└── init.ps1                   # Script de configuración
```

## 🚀 Setup Rápido (Recomendado)

Simplemente ejecuta el script de inicialización en PowerShell:

```powershell
./init.ps1
```

---

## 🛠️ Configuración Manual (4 pasos)

Si prefieres no usar el script:

1. **Crear carpetas**: `mkdir -p .agent/workflows .agent/skills/core docs`
2. **Copiar Recursos**: Mueve el contenido de la carpeta `.agent/` a la raíz de tu proyecto.
3. **Inicializar Documentos**: Copia las plantillas `.template` a la carpeta `docs/` y quítales la extensión `.template`.
4. **Personalizar**: Edita `.agent/skills/core/SKILL.md` con el nombre y propósito de tu proyecto.

---

## ⌨️ Workflows Disponibles

Usa estos comandos directamente en el chat de Antigravity para mantener tu proyecto al día:

| Comando | Acción | Beneficio |
|:---|:---|:---|
| `/log-session` | Registra la sesión en `docs/LOGS.md` | Trazabilidad total del trabajo. |
| `/update-changelog` | Actualiza `docs/CHANGELOG.md` | Historial de versiones automático. |
| `/document-feature` | Documenta en `docs/MANUAL.md` | Memoria técnica siempre al día. |
| `/session-summary` | Genera un resumen ejecutivo | Ideal para revisiones rápidas. |
| `/new-version` | Prepara un nuevo release | Gestión de versiones sin fricción. |

---

## 💡 ¿Por qué usar esta plantilla?

- **Consistencia**: Todos tus proyectos tendrán la misma estructura profesional.
- **Contexto**: Antigravity leerá tus logs y manuales para darte mejores sugerencias.
- **Eficiencia**: Menos tiempo documentando a mano, más tiempo programando.

---

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Consulta el archivo [LICENSE](LICENSE) para más detalles.

---
*Optimiza tu desarrollo, deja que Antigravity se encargue del resto.* 🛸
