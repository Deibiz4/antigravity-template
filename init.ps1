# Antigravity Template Initializer
# This script sets up the project structure based on the templates.

Write-Host "🚀 Iniciando configuración de Antigravity Template..." -ForegroundColor Cyan

# 1. Create directory structure
Write-Host "📁 Creando estructura de carpetas..." -ForegroundColor Yellow
$dirs = @(".agent/workflows", ".agent/skills/core", "docs")
foreach ($dir in $dirs) {
    if (!(Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
        Write-Host "   ✅ Creada: $dir" -ForegroundColor Green
    } else {
        Write-Host "   ℹ️ Ya existe: $dir" -ForegroundColor Gray
    }
}

# 2. Copy Templates to docs (if they don't exist yet)
Write-Host "📝 Inicializando archivos de documentación..." -ForegroundColor Yellow
$templates = @{
    "LOGS.md.template" = "docs/LOGS.md"
    "CHANGELOG.md.template" = "docs/CHANGELOG.md"
    "MANUAL.md.template" = "docs/MANUAL.md"
    "ANTIGRAVITY.md.template" = "docs/ANTIGRAVITY.md"
}

foreach ($template in $templates.Keys) {
    $target = $templates[$template]
    if (Test-Path $template) {
        if (!(Test-Path $target)) {
            Copy-Item -Path $template -Destination $target
            Write-Host "   ✅ Creado: $target" -ForegroundColor Green
        } else {
            Write-Host "   ℹ️ Ya existe: $target (omitiendo)" -ForegroundColor Gray
        }
    } else {
        Write-Host "   ❌ No se encontró la plantilla: $template" -ForegroundColor Red
    }
}

# 3. Instructions for the user
Write-Host "`n✨ ¡Configuración completada!" -ForegroundColor Cyan
Write-Host "Próximos pasos:" -ForegroundColor White
Write-Host "1. Edita .agent/skills/core/SKILL.md con los datos de tu proyecto." -ForegroundColor White
Write-Host "2. Empieza a usar los comandos /log-session, /update-changelog, etc." -ForegroundColor White
Write-Host "3. ¡Disfruta de tu flujo de trabajo optimizado! 🚀" -ForegroundColor White
