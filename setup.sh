#!/bin/bash

# ═══════════════════════════════════════════════════════════════════════════
# SETUP SCRIPT FOR PERFORACIONZ DATABASE
# Platform: Linux/macOS (Bash)
# Purpose: Automated database initialization with single command
# Usage: ./setup.sh [--user postgres] [--password ''] [--host localhost] [--port 5432] [--db PerforacionZ] [--no-test-data]
# ═══════════════════════════════════════════════════════════════════════════

# Default values
PG_USER="postgres"
PG_PASSWORD=""
PG_HOST="localhost"
PG_PORT="5432"
DB_NAME="PerforacionZ"
LOAD_TEST_DATA=true
SKIP_DB_CREATION=false

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Helper functions
function write_success() {
    echo -e "${GREEN}[✓]${NC} $1"
}

function write_error() {
    echo -e "${RED}[✗]${NC} $1"
}

function write_info() {
    echo -e "${CYAN}[ℹ]${NC} $1"
}

function write_section() {
    echo ""
    echo -e "${YELLOW}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "${YELLOW}$1${NC}"
    echo -e "${YELLOW}═══════════════════════════════════════════════════════════════${NC}"
    echo ""
}

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --user)
            PG_USER="$2"
            shift 2
            ;;
        --password)
            PG_PASSWORD="$2"
            shift 2
            ;;
        --host)
            PG_HOST="$2"
            shift 2
            ;;
        --port)
            PG_PORT="$2"
            shift 2
            ;;
        --db)
            DB_NAME="$2"
            shift 2
            ;;
        --no-test-data)
            LOAD_TEST_DATA=false
            shift
            ;;
        --skip-db-creation)
            SKIP_DB_CREATION=true
            shift
            ;;
        *)
            echo "Opción desconocida: $1"
            echo "Uso: ./setup.sh [--user postgres] [--password ''] [--host localhost] [--port 5432] [--db PerforacionZ] [--no-test-data] [--skip-db-creation]"
            exit 1
            ;;
    esac
done

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check PostgreSQL installation
write_section "VERIFICANDO REQUISITOS"
if ! command -v psql &> /dev/null; then
    write_error "PostgreSQL no está instalado o no está en PATH"
    write_info "Instrucciones de instalación:"
    write_info "  - Ubuntu/Debian: sudo apt-get install postgresql-client"
    write_info "  - macOS: brew install postgresql"
    write_info "  - Windows: Descargar desde https://www.postgresql.org/download/windows/"
    exit 1
fi

PSQL_VERSION=$(psql --version)
write_success "PostgreSQL encontrado: $PSQL_VERSION"

# Set PostgreSQL environment variables
export PGHOST=$PG_HOST
export PGPORT=$PG_PORT
export PGUSER=$PG_USER
if [ -n "$PG_PASSWORD" ]; then
    export PGPASSWORD=$PG_PASSWORD
fi

# Check required files
write_section "VERIFICANDO ARCHIVOS REQUERIDOS"
REQUIRED_FILES=(
    "DDL_PERFORACIONZ.SQL"
    "SETUP_CLEAN_DB.SQL"
    "SETUP_TEST_DATA.SQL"
    "VERIFICAR_DATOS.SQL"
)

for file in "${REQUIRED_FILES[@]}"; do
    FILE_PATH="$SCRIPT_DIR/$file"
    if [ -f "$FILE_PATH" ]; then
        write_success "Encontrado: $file"
    else
        write_error "Falta archivo requerido: $file"
        write_info "Ubicación esperada: $SCRIPT_DIR/$file"
        exit 1
    fi
done

# Main setup process
write_section "INICIANDO CONFIGURACIÓN DE PERFORACIONZ"

# Step 1: Create database
if [ "$SKIP_DB_CREATION" = false ]; then
    write_info "Paso 1/4: Creando base de datos '$DB_NAME'..."
    if psql -U $PG_USER -c "CREATE DATABASE $DB_NAME;" 2>/dev/null; then
        write_success "Base de datos '$DB_NAME' creada"
    else
        write_info "Base de datos ya existe o error al crear (continuando...)"
    fi
else
    write_info "Paso 1/4: Saltando creación de base de datos"
fi

# Step 2: Load DDL and functions
write_info "Paso 2/4: Cargando estructura de base de datos (DDL y funciones)..."
SETUP_CLEAN_PATH="$SCRIPT_DIR/SETUP_CLEAN_DB.SQL"
if psql -U $PG_USER -d $DB_NAME -f "$SETUP_CLEAN_PATH" > /dev/null 2>&1; then
    write_success "Estructura de base de datos cargada"
else
    write_error "Error al cargar estructura"
    exit 1
fi

# Step 3: Load test data (optional)
if [ "$LOAD_TEST_DATA" = true ]; then
    write_info "Paso 3/4: Cargando datos de prueba..."
    TEST_DATA_PATH="$SCRIPT_DIR/SETUP_TEST_DATA.SQL"
    if psql -U $PG_USER -d $DB_NAME -f "$TEST_DATA_PATH" > /dev/null 2>&1; then
        write_success "Datos de prueba cargados (40 brocas, 3 proyectos, 15 perforaciones)"
    else
        write_error "Error al cargar datos de prueba"
        exit 1
    fi
else
    write_info "Paso 3/4: Saltando datos de prueba"
fi

# Step 4: Verify installation
write_info "Paso 4/4: Verificando instalación..."
VERIFY_PATH="$SCRIPT_DIR/VERIFICAR_DATOS.SQL"
if OUTPUT=$(psql -U $PG_USER -d $DB_NAME -f "$VERIFY_PATH" 2>&1); then
    write_success "Verificación completada:"
    echo "$OUTPUT"
else
    write_error "Error en verificación"
fi

# Success message
write_section "¡INSTALACIÓN COMPLETADA! ✓"
write_info "Base de datos: $DB_NAME"
write_info "Host: $PG_HOST:$PG_PORT"
write_info "Usuario: $PG_USER"
echo ""
write_info "Próximos pasos:"
write_info "1. Conectar a la base de datos:"
echo -e "   ${GREEN}psql -U $PG_USER -d $DB_NAME${NC}"
write_info "2. Ver estadísticas:"
echo -e "   ${GREEN}psql -U $PG_USER -d $DB_NAME -f ESTADISTICAS/01_ESTADISTICAS_RENDIMIENTO_BROCAS.SQL${NC}"
write_info "3. Consultar documentación:"
echo -e "   ${GREEN}- README.md (este directorio)${NC}"
echo -e "   ${GREEN}- ESTADISTICAS/README.md${NC}"
echo ""
