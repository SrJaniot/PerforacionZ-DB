# ═══════════════════════════════════════════════════════════════════════════
# SETUP SCRIPT FOR PERFORACIONZ DATABASE
# Platform: Windows PowerShell 5.1+
# Purpose: Automated database initialization with single command
# ═══════════════════════════════════════════════════════════════════════════

param(
    [Parameter(HelpMessage = "PostgreSQL username")]
    [string]$PgUser = "postgres",
    
    [Parameter(HelpMessage = "PostgreSQL password")]
    [string]$PgPassword = "",
    
    [Parameter(HelpMessage = "PostgreSQL host")]
    [string]$PgHost = "localhost",
    
    [Parameter(HelpMessage = "PostgreSQL port")]
    [int]$PgPort = 5432,
    
    [Parameter(HelpMessage = "Database name")]
    [string]$DbName = "PerforacionZ",
    
    [Parameter(HelpMessage = "Load test data")]
    [switch]$WithTestData = $true,
    
    [Parameter(HelpMessage = "Skip database creation")]
    [switch]$SkipDbCreation = $false
)

# Color output
function Write-Success { Write-Host "[✓] $args" -ForegroundColor Green }
function Write-Error { Write-Host "[✗] $args" -ForegroundColor Red }
function Write-Info { Write-Host "[ℹ] $args" -ForegroundColor Cyan }
function Write-Section { Write-Host "`n═══════════════════════════════════════════════════════════════` -ForegroundColor Yellow; Write-Host "$args" -ForegroundColor Yellow; Write-Host "═══════════════════════════════════════════════════════════════`n" -ForegroundColor Yellow }

# Check PostgreSQL installation
Write-Section "VERIFICANDO REQUISITOS"
try {
    $psqlVersion = psql --version 2>&1
    Write-Success "PostgreSQL encontrado: $psqlVersion"
} catch {
    Write-Error "PostgreSQL no está instalado o no está en PATH"
    Write-Info "Descárgalo desde: https://www.postgresql.org/download/windows/"
    exit 1
}

# Set environment variables for psql
$env:PGHOST = $PgHost
$env:PGPORT = $PgPort
$env:PGUSER = $PgUser
if ($PgPassword) {
    $env:PGPASSWORD = $PgPassword
}

# Get script directory
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Check required files
Write-Section "VERIFICANDO ARCHIVOS REQUERIDOS"
$requiredFiles = @(
    "DDL_PERFORACIONZ.SQL",
    "SETUP_CLEAN_DB.SQL",
    "SETUP_TEST_DATA.SQL",
    "VERIFICAR_DATOS.SQL"
)

foreach ($file in $requiredFiles) {
    $filePath = Join-Path $scriptDir $file
    if (Test-Path $filePath) {
        Write-Success "Encontrado: $file"
    } else {
        Write-Error "Falta archivo requerido: $file"
        exit 1
    }
}

# Main setup process
Write-Section "INICIANDO CONFIGURACIÓN DE PERFORACIONZ"

# Step 1: Create database
if (-not $SkipDbCreation) {
    Write-Info "Paso 1/4: Creando base de datos '$DbName'..."
    try {
        $createDbQuery = "CREATE DATABASE $DbName;"
        psql -U $PgUser -c $createDbQuery | Out-Null
        Write-Success "Base de datos '$DbName' creada"
    } catch {
        # Database might already exist
        Write-Info "Base de datos ya existe o error al crear"
    }
} else {
    Write-Info "Paso 1/4: Saltando creación de base de datos"
}

# Step 2: Load DDL and functions
Write-Info "Paso 2/4: Cargando estructura de base de datos (DDL y funciones)..."
try {
    $setupCleanPath = Join-Path $scriptDir "SETUP_CLEAN_DB.SQL"
    psql -U $PgUser -d $DbName -f $setupCleanPath | Out-Null
    Write-Success "Estructura de base de datos cargada"
} catch {
    Write-Error "Error al cargar estructura: $_"
    exit 1
}

# Step 3: Load test data (optional)
if ($WithTestData) {
    Write-Info "Paso 3/4: Cargando datos de prueba..."
    try {
        $testDataPath = Join-Path $scriptDir "SETUP_TEST_DATA.SQL"
        psql -U $PgUser -d $DbName -f $testDataPath | Out-Null
        Write-Success "Datos de prueba cargados (40 brocas, 3 proyectos, 15 perforaciones)"
    } catch {
        Write-Error "Error al cargar datos de prueba: $_"
        exit 1
    }
} else {
    Write-Info "Paso 3/4: Saltando datos de prueba"
}

# Step 4: Verify installation
Write-Info "Paso 4/4: Verificando instalación..."
try {
    $verifyPath = Join-Path $scriptDir "VERIFICAR_DATOS.SQL"
    $output = psql -U $PgUser -d $DbName -f $verifyPath 2>&1
    Write-Success "Verificación completada:"
    Write-Host $output
} catch {
    Write-Error "Error en verificación: $_"
}

Write-Section "¡INSTALACIÓN COMPLETADA! ✓"
Write-Info "Base de datos: $DbName"
Write-Info "Host: $PgHost:$PgPort"
Write-Info "Usuario: $PgUser"
Write-Info ""
Write-Info "Próximos pasos:"
Write-Info "1. Conectar a la base de datos:"
Write-Host "   psql -U $PgUser -d $DbName" -ForegroundColor Green
Write-Info "2. Ver estadísticas:"
Write-Host "   psql -U $PgUser -d $DbName -f ESTADISTICAS/01_ESTADISTICAS_RENDIMIENTO_BROCAS.SQL" -ForegroundColor Green
Write-Info "3. Consultar documentación:"
Write-Host "   - README.md (este directorio)" -ForegroundColor Green
Write-Host "   - ESTADISTICAS/README.md" -ForegroundColor Green

Write-Host ""
