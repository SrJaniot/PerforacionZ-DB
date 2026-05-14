# 🚧 PerforacionZ Database (EN DESARROLLO)

> **Estado**: ⚠️ En Desarrollo - Versión 1.0.0-beta
> 
> Este proyecto está en fase de desarrollo activo. La funcionalidad está completa pero sujeta a cambios.

Sistema de gestión de perforaciones y análisis de rendimiento de brocas para proyectos de perforación. Desarrollado en PostgreSQL con funciones SQL para operaciones CRUD y análisis estadístico avanzado.

## 📋 Tabla de Contenidos

- [Descripción](#descripción)
- [🆕 Últimas Novedades](#-últimas-novedades-mayo-2026)
- [Requisitos](#requisitos)
- [⚡ Setup Rápido (Recomendado)](#⚡-setup-rápido-recomendado)
- [Instalación Paso a Paso](#instalación-paso-a-paso)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Tablas de Base de Datos](#tablas-de-base-de-datos)
- [Funciones SQL](#funciones-sql)
- [Estadísticas y Reportes](#estadísticas-y-reportes)
- [Uso](#uso)
- [Guía Rápida](#guía-rápida)

## 📌 Descripción

PerforacionZ es un sistema integral para:

- **Gestión de Brocas**: Seguimiento de inventario de brocas (40 instancias disponibles)
- **Registro de Perforaciones**: Documentación detallada de proyectos, perforaciones y tramos
- **Análisis de Rendimiento**: Estadísticas comparativas sobre efectividad de brocas por tipo de suelo
- **Distribución Geográfica**: Análisis de uso por municipios y departamentos
- **Métricas de Desgaste**: Cálculo de vida útil y índices de deterioro

**Contexto**: Base de datos para operaciones de perforación con análisis de efectividad de herramientas según tipo de suelo y ubicación geográfica.

## 🆕 Últimas Novedades (Mayo 2026)

### Nuevas Funcionalidades

#### 1. Eliminación de Brocas y Brocas Instanciadas
- **FUN_ELIMINAR_BROCA_POR_ID_JSON**: Elimina un modelo de broca de la base de datos (solo si no está siendo usada)
- **FUN_ELIMINAR_BROCAINSTANCIADA_POR_ID_JSON**: Elimina una instancia de broca del inventario

#### 2. Consultas Avanzadas de Brocas por Supervisor
Dos versiones nuevas para consultar las brocas utilizadas por un supervisor:

**a) Versión Jerárquica (FUN_OBTENER_BROCAS_POR_SUPERVISOR_JSON)**
- Retorna estructura anidada: Supervisor → Proyectos → Perforaciones → Brocas
- Ideal para análisis detallado y visualización en árboles/dashboards
- Incluye el **último movimiento** de cada broca (ENTRADA/SALIDA)
- Información completa: ID, nombre, tipo, marca, tamaño de broca + metadata de movimiento

**b) Versión Simple/Plana (FUN_OBTENER_BROCAS_POR_SUPERVISOR_SIMPLE_JSON)**
- Retorna lista plana de todas las brocas del supervisor
- Ideal para reportes, exportación a Excel/CSV
- Más eficiente en consultas simples
- Incluye el **último movimiento** de cada broca

**Campos retornados en ambas versiones**:
```json
{
  "ID_BROCA_INSTANCIADA": "BROCA-001",
  "ID_BROCA": 1,
  "NOM_BROCA": "Broca PDC 5 7/8",
  "TIPO_BROCA": "PDC",
  "TAMANIO_BROCA": 5.875,
  "MARCA_BROCA": "Smith Services",
  "ESTADO_BROCA": "EN_USO",
  "TIPO_MOVIMIENTO": "ENTRADA",
  "PROFUNDIDAD_MOVIMIENTO": 0.0,
  "FECHA_HORA_MOVIMIENTO": "2026-03-01T08:30:00"
}
```

**Ejemplo de uso**:
```sql
-- Obtener brocas jerárquicas de supervisor 'SUP001'
SELECT FUN_OBTENER_BROCAS_POR_SUPERVISOR_JSON('SUP001');

-- Obtener brocas planas de supervisor 'SUP001'
SELECT FUN_OBTENER_BROCAS_POR_SUPERVISOR_SIMPLE_JSON('SUP001');
```

---

- **PostgreSQL** 12.0 o superior
- **PgAdmin** (opcional, para administración visual)
- **Git** (para versionamiento)

## ⚡ Setup Rápido (Recomendado)

**Windows (PowerShell)**:
```powershell
# 1. Abrir PowerShell en la carpeta del proyecto
cd v:\proyectos\PerforacionZ\db

# 2. Ejecutar script de setup completo
.\setup.ps1
```

**Linux/Mac (Bash)**:
```bash
# 1. Ir a la carpeta del proyecto
cd /ruta/a/PerforacionZ/db

# 2. Ejecutar script de setup completo
./setup.sh
```

**Opción Manual Rápida (PostgreSQL CLI)**:
```bash
# 1. Clonear repositorio
git clone https://github.com/usuario/PerforacionZ.git
cd PerforacionZ/db

# 2. Setup completo en una línea
psql -U postgres -c "CREATE DATABASE PerforacionZ;" && \
psql -U postgres -d PerforacionZ -f DDL_PERFORACIONZ.SQL && \
psql -U postgres -d PerforacionZ -f SETUP_CLEAN_DB.SQL && \
psql -U postgres -d PerforacionZ -f SETUP_TEST_DATA.SQL && \
psql -U postgres -d PerforacionZ -f VERIFICAR_DATOS.SQL
```

✅ **Listo en ~2 minutos** (incluyendo 40 brocas, 3 proyectos y datos de prueba)

---

## 📦 Instalación Paso a Paso

Si prefieres instalar manualmente:

### 1. Clonar el Repositorio

```bash
git clone https://github.com/usuario/PerforacionZ.git
cd PerforacionZ/db
```

### 2. Crear Base de Datos

```sql
-- En PostgreSQL
CREATE DATABASE PerforacionZ;
```

### 3. Opción A: Usar Script de Setup Limpio (RECOMENDADO)

Este script crea todas las tablas y funciones automáticamente:

```bash
psql -U postgres -d PerforacionZ -f SETUP_CLEAN_DB.SQL
```

**Qué incluye**:
- ✅ Creación de todas las tablas (DDL)
- ✅ Creación de todas las funciones (CRUD)
- ✅ Datos iniciales (departamentos, municipios, suelos, supervisores)

### Opción B: Instalación Manual (Paso a Paso)

Si necesitas control total:

#### 3.1 Cargar DDL (Estructura de Tablas)

```bash
psql -U postgres -d PerforacionZ -f DDL_PERFORACIONZ.SQL
```

#### 3.2 Crear Funciones (Operaciones CRUD)

Ejecutar en orden los archivos de funciones:

```bash
# Ejecutar cada carpeta de funciones
psql -U postgres -d PerforacionZ -f FUNCIONES/FUN_DPTOS/FUN_TAB_DPTOS.SQL
psql -U postgres -d PerforacionZ -f FUNCIONES/FUN_MUNICIPIOS/FUN_TAB_MUNICIPIOS.SQL
psql -U postgres -d PerforacionZ -f FUNCIONES/FUN_SUELOS/FUN_TAB_SUELOS.SQL
psql -U postgres -d PerforacionZ -f FUNCIONES/FUN_BROCAS/FUN_TAB_BROCAS.SQL
psql -U postgres -d PerforacionZ -f FUNCIONES/FUN_BROCAINSTANCIADAS/FUN_TAB_BROCAINSTANCIADAS.SQL
psql -U postgres -d PerforacionZ -f FUNCIONES/FUN_PROYECTOS/FUN_TAB_PROYECTOS.SQL
psql -U postgres -d PerforacionZ -f FUNCIONES/FUN_PERFORACIONES/FUN_TAB_PERFORACIONES.SQL
psql -U postgres -d PerforacionZ -f FUNCIONES/FUN_TRAMO_SUELO/FUN_TAB_TRAMO_SUELO.SQL
psql -U postgres -d PerforacionZ -f FUNCIONES/FUN_MOVIMIENTO_DE_BROCA/FUN_TAB_MOVIMIENTO_DE_BROCA.SQL
psql -U postgres -d PerforacionZ -f FUNCIONES/FUN_SUPERVISORES/FUN_TAB_SUPERVISORES.SQL
```

### 4. Cargar Datos de Prueba (Opcional)

Agrega 40 brocas, 3 proyectos, 15 perforaciones y datos de ejemplo:

```bash
psql -U postgres -d PerforacionZ -f SETUP_TEST_DATA.SQL
```

### 5. Verificar Instalación

Verifica que todo se instaló correctamente:

```bash
psql -U postgres -d PerforacionZ -f VERIFICAR_DATOS.SQL
```

Debería mostrar resumen de datos cargados ✅

## 📁 Estructura del Proyecto

```
PerforacionZ/db/
├── README.md                          # Este archivo
├── DDL_PERFORACIONZ.SQL               # Creación de tablas (esquema)
├── SETUP_CLEAN_DB.SQL                 # Script de inicialización limpia
├── SETUP_TEST_DATA.SQL                # Datos de prueba (40 brocas, 60 movimientos)
├── VERIFICAR_DATOS.SQL                # Script de verificación de datos
│
├── FUNCIONES/                         # Funciones CRUD para cada tabla
│   ├── FUN_DPTOS/
│   │   ├── DML_TAB_DPTOS.SQL          # Datos de departamentos
│   │   ├── FUN_TAB_DPTOS.SQL          # Funciones para gestionar dptos
│   │   └── PRU_FUN_TAB_DPTOS.SQL      # Pruebas unitarias
│   ├── FUN_MUNICIPIOS/
│   ├── FUN_SUPERVISORES/
│   ├── FUN_SUELOS/
│   ├── FUN_BROCAS/
│   ├── FUN_BROCAINSTANCIADAS/
│   ├── FUN_PROYECTOS/
│   ├── FUN_PERFORACIONES/
│   ├── FUN_TRAMO_SUELO/
│   └── FUN_MOVIMIENTO_DE_BROCA/
│
└── ESTADISTICAS/                      # Análisis y reportes
    ├── README.md                      # Documentación de estadísticas
    ├── 01_ESTADISTICAS_RENDIMIENTO_BROCAS.SQL
    ├── 02_ESTADISTICAS_BROCAS_POR_SUELO.SQL
    ├── 03_ESTADISTICAS_BROCAS_POR_LOCALIDADES.SQL
    ├── 04_ESTADISTICAS_CONSUMO_DESGASTE.SQL
    ├── 05_DASHBOARD_RESUMEN_GENERAL.SQL
    ├── 06_ANALISIS_AVANZADO_COMPARATIVO.SQL
    └── GUIA_RAPIDA_CONSULTAS.SQL
```

## 📊 Tablas de Base de Datos

### Tablas Independientes

#### TAB_DPTOS (Departamentos)
```sql
ID_DPTO (CHAR 2, PK)          -- Código de departamento
NOM_DPTO (VARCHAR)             -- Nombre del departamento
```

#### TAB_SUPERVISORES
```sql
ID_SUPERVISOR (VARCHAR, PK)    -- ID único del supervisor
NOM_SUPERVISOR (VARCHAR)       -- Nombre completo
CORREO_SUPERVISOR (VARCHAR)    -- Email de contacto
NUEM_CEL_SUPERVISOR (VARCHAR)  -- Teléfono celular
FOTO_PERFIL_SUPERVISOR (VARCHAR) -- URL de foto de perfil
FECHA_CREACION (TIMESTAMP)     -- Cuándo se registró
USUARIO_CREACION (VARCHAR)     -- Usuario que creó el registro
```

#### TAB_SUELOS (Tipos de Suelo)
```sql
ID_SUELO (INTEGER, PK)         -- ID único del tipo de suelo
NOM_SUELO (VARCHAR)            -- Nombre del suelo (Arcilla, Arena, etc)
TIPO_SUELO (VARCHAR)           -- Tipo técnico de suelo
DESCRIPCION_SUELO (VARCHAR)    -- Descripción detallada
FECHA_CREACION (TIMESTAMP)
USUARIO_CREACION (VARCHAR)
```

#### TAB_BROCAS (Modelos de Brocas)
```sql
ID_BROCA (INTEGER, PK)         -- ID único del modelo
NOM_BROCA (VARCHAR)            -- Nombre comercial
TIPO_BROCA (VARCHAR)           -- Tipo (Diamante, Carburo, PDC, Tricónica, Impregnada)
DESCRIPCION_BROCA (VARCHAR)    -- Descripción técnica
TAMANIO_BROCA (FLOAT)          -- Diámetro en pulgadas
MATRIX_BROCA (VARCHAR)         -- Material de matriz (PDC Matrix, Acero, Diamante, etc)
MARCA_BROCA (VARCHAR)          -- Marca del fabricante (Smith Services, Baker Hughes, Halliburton, etc)
FECHA_CREACION (TIMESTAMP)
USUARIO_CREACION (VARCHAR)
FECHA_MODIFICACION (TIMESTAMP)
USUARIO_MODIFICACION (VARCHAR)
```

### Tablas Dependientes

#### TAB_MUNICIPIOS
```sql
ID_MUNICIPIO (CHAR 5, PK)      -- Código DANE
NOM_MUNICIPIO (VARCHAR)        -- Nombre del municipio
ID_DPTO (CHAR 2, FK)           -- Referencia a TAB_DPTOS
```

#### TAB_PROYECTOS
```sql
ID_PROYECTO (INTEGER, PK)      -- ID único del proyecto
NOM_PROYECTO (VARCHAR)         -- Nombre del proyecto
ID_MUNICIPIO (CHAR 5, FK)      -- Ubicación del proyecto
ID_SUPERVISOR (VARCHAR, FK)    -- Supervisor responsable
FECHA_INICIO (TIMESTAMP)
FECHA_FIN (TIMESTAMP)
```

#### TAB_PERFORACIONES
```sql
ID_PERFORACION (INTEGER, PK)   -- ID único
ID_PROYECTO (INTEGER, FK)      -- Proyecto al que pertenece
PROFUNDIDAD_ACTUAL (FLOAT)     -- Metros perforados hasta ahora
PROFUNDIDAD_DISEÑO (FLOAT)     -- Meta de profundidad
FECHA_INICIO_PERFORACION (TIMESTAMP)
FECHA_FIN_PERFORACION (TIMESTAMP)
```

#### TAB_BROCAINSTANCIADAS (Inventario de Brocas)
```sql
ID_BROCA_INSTANCIADA (VARCHAR, PK) -- Serial: BROCA-001 a BROCA-040
ID_BROCA (INTEGER, FK)         -- Modelo de broca
ESTADO_BROCA (VARCHAR)         -- NUEVA | EN_USO | DAÑADA | DESCARTADA
FECHA_REGISTRO_BROCA (TIMESTAMP)
FECHA_ULTIMO_USO_BROCA (TIMESTAMP)
```

#### TAB_TRAMO_SUELO
```sql
ID_TRAMO (INTEGER, PK)         -- ID único del tramo
ID_PERFORACION (INTEGER, FK)   -- Perforación a la que pertenece
ID_SUELO (INTEGER, FK)         -- Tipo de suelo encontrado
PROFUNDIDAD_INICIO (FLOAT)     -- Profundidad donde comienza (metros)
PROFUNDIDAD_FIN (FLOAT)        -- Profundidad donde termina (metros)
```

#### TAB_MOVIMIENTO_DE_BROCA (Registro de Uso)
```sql
ID_MOVIMIENTO (INTEGER, PK)    -- ID único del movimiento
ID_BROCA_INSTANCIADA (VARCHAR, FK) -- Qué broca se movió
ID_PERFORACION (INTEGER, FK)   -- En qué perforación
FECHA_HORA_MOVIMIENTO (TIMESTAMP) -- Cuándo ocurrió
TIPO_MOVIMIENTO (VARCHAR)      -- ENTRADA | SALIDA
PROFUNDIDAD_MOVIMIENTO (FLOAT) -- A qué profundidad
```

## 🔧 Funciones SQL

Cada carpeta en `FUNCIONES/` contiene tres archivos:

- **DML_TAB_*.SQL**: Datos iniciales para esa tabla
- **FUN_TAB_*.SQL**: Funciones para operaciones CRUD
- **PRU_FUN_*.SQL**: Pruebas unitarias

### Patrones de Nomenclatura

Las funciones siguen el patrón:
- `FUN_INSERTAR_*` - Insert (crear)
- `FUN_ACTUALIZAR_*` - Update (modificar)
- `FUN_OBTENER_*` - Read (consultar)
- `FUN_ELIMINAR_*` - Delete (eliminar)

Todas retornan JSON con estructura: `{CODIGO, MENSAJE, DATOS}`

### Ejemplo: Funciones para Brocas

#### Insertar una broca (con marca)
```sql
SELECT FUN_INSERTAR_BROCAS_JSON(
    'Broca PDC 5 7/8',           -- Nombre
    'PDC',                        -- Tipo
    'Broca PDC para formaciones duras',  -- Descripción
    5.875,                        -- Tamaño
    'PDC Matrix',                 -- Matrix
    'Smith Services',             -- Marca
    'admin'                       -- Usuario
);
```

#### Actualizar una broca (con marca)
```sql
SELECT FUN_ACTUALIZAR_BROCAS_JSON(
    1,                            -- ID Broca
    'Broca Actualizada',
    'TRICONICA',
    'Descripción actualizada',
    6.0,
    'Acero Mejorado',
    'Baker Hughes',               -- Marca
    'admin'
);
```

#### ✨ NUEVO: Eliminar una broca
```sql
SELECT FUN_ELIMINAR_BROCA_POR_ID_JSON(1);
```

#### Obtener una broca
```sql
SELECT FUN_OBTENER_BROCA_POR_ID_JSON(1);
```

#### Obtener todas las brocas
```sql
SELECT FUN_OBTENER_TODAS_BROCAS_JSON();
```

### Ejemplo: Nuevas Funciones de Brocas por Supervisor

#### ✨ Obtener brocas - Versión Jerárquica
```sql
SELECT FUN_OBTENER_BROCAS_POR_SUPERVISOR_JSON('SUP001');

-- Retorna:
{
  "CODIGO": 200,
  "MENSAJE": "Brocas obtenidas exitosamente para el supervisor",
  "DATOS": {
    "ID_SUPERVISOR": "SUP001",
    "NOM_SUPERVISOR": "Juan Pérez",
    "PROYECTOS": [
      {
        "ID_PROYECTO": 1,
        "NOM_PROYECTO": "Proyecto X",
        "PERFORACIONES": [
          {
            "ID_PERFORACION": 1,
            "PROFUNDIDAD_ACTUAL": 150,
            "BROCAS_INSTANCIADAS": [
              {
                "ID_BROCA_INSTANCIADA": "BROCA-001",
                "NOM_BROCA": "Broca PDC 5 7/8",
                "MARCA_BROCA": "Smith Services",
                "TIPO_MOVIMIENTO": "ENTRADA",
                "PROFUNDIDAD_MOVIMIENTO": 0.0,
                "FECHA_HORA_MOVIMIENTO": "2026-03-01T08:30:00"
              }
            ]
          }
        ]
      }
    ]
  }
}
```

#### ✨ Obtener brocas - Versión Simple/Plana
```sql
SELECT FUN_OBTENER_BROCAS_POR_SUPERVISOR_SIMPLE_JSON('SUP001');

-- Retorna lista plana (mejor para reportes/Excel):
[
  {
    "ID_PROYECTO": 1,
    "ID_PERFORACION": 1,
    "ID_BROCA_INSTANCIADA": "BROCA-001",
    "NOM_BROCA": "Broca PDC 5 7/8",
    "MARCA_BROCA": "Smith Services",
    "TIPO_MOVIMIENTO": "ENTRADA",
    "PROFUNDIDAD_MOVIMIENTO": 0.0,
    "FECHA_HORA_MOVIMIENTO": "2026-03-01T08:30:00"
  },
  ...
]
```

### Ejemplo: Funciones para Brocas Instanciadas

#### Eliminar una broca del inventario
```sql
SELECT FUN_ELIMINAR_BROCAINSTANCIADA_POR_ID_JSON('BROCA-001');

-- Retorna:
{
  "CODIGO": 200,
  "MENSAJE": "Broca instanciada eliminada exitosamente"
}
```

## 📈 Estadísticas y Reportes

La carpeta `ESTADISTICAS/` contiene análisis avanzados sobre el rendimiento de brocas.

### Archivos Disponibles

| Archivo | Propósito | Queries |
|---------|-----------|---------|
| **01_ESTADISTICAS_RENDIMIENTO_BROCAS.SQL** | Ranking de brocas por profundidad perforada, eficiencia y durabilidad | 3 |
| **02_ESTADISTICAS_BROCAS_POR_SUELO.SQL** | Efectividad de brocas según tipo de suelo, matriz de rendimiento | 4 |
| **03_ESTADISTICAS_BROCAS_POR_LOCALIDADES.SQL** | Distribución geográfica de uso, brocas por municipio y departamento | 4 |
| **04_ESTADISTICAS_CONSUMO_DESGASTE.SQL** | Análisis de vida útil, inventario, rotación, desgaste e índices | 5 |
| **05_DASHBOARD_RESUMEN_GENERAL.SQL** | KPIs ejecutivos, alertas de inventario, recomendaciones del sistema | 5 |
| **06_ANALISIS_AVANZADO_COMPARATIVO.SQL** | Benchmarking entre modelos, análisis temporal, especialización | 6 |
| **GUIA_RAPIDA_CONSULTAS.SQL** | Plantillas listas para usar, queries comunes | 5 |

### Cómo Usar las Estadísticas

1. **Abrir archivo** en PgAdmin o editor SQL
2. **Copiar UNA query** (desde SELECT hasta ;)
3. **Ejecutar** con Ctrl+Enter
4. **Ver resultados** en tabla de output
5. **Pasar a siguiente** query con los comentarios como referencia

**Nota**: Los archivos contienen múltiples queries independientes, no están conectadas con UNION.

### Ejemplos de Consultas Incluidas

**¿Cuál broca perfora mejor?**
```
01_ESTADISTICAS_RENDIMIENTO_BROCAS.SQL → Query 1: Top 10 brocas por profundidad total
```

**¿Qué broca funciona mejor en cada tipo de suelo?**
```
02_ESTADISTICAS_BROCAS_POR_SUELO.SQL → Query 4: Recomendación de broca por tipo de suelo
```

**¿En qué municipios se usa más cada broca?**
```
03_ESTADISTICAS_BROCAS_POR_LOCALIDADES.SQL → Query 2: Distribución por municipio
```

**¿Cuál es la vida útil de cada broca?**
```
04_ESTADISTICAS_CONSUMO_DESGASTE.SQL → Query 3: Vida útil estimada
```

## 🚀 Uso

### Workflow Típico

#### 1. Insertar Datos

```sql
-- Registrar un nuevo proyecto
SELECT FUN_INS_TAB_PROYECTOS('Proyecto X', '76001', 'SUP001', NOW(), NOW() + INTERVAL '6 months');

-- Registrar una perforación en ese proyecto
SELECT FUN_INS_TAB_PERFORACIONES(1, 0.0, 150.0, NOW(), NULL);

-- Registrar tramos de suelo encontrados
SELECT FUN_INS_TAB_TRAMO_SUELO(1, 1, 1, 0.0, 50.0);    -- 0-50m: Arcilla
SELECT FUN_INS_TAB_TRAMO_SUELO(1, 2, 2, 50.0, 100.0);  -- 50-100m: Arena
SELECT FUN_INS_TAB_TRAMO_SUELO(1, 3, 3, 100.0, 150.0); -- 100-150m: Roca
```

#### 2. Registrar Uso de Brocas

```sql
-- Registrar entrada de broca a perforación
SELECT FUN_INS_TAB_MOVIMIENTO_DE_BROCA('BROCA-001', 1, NOW(), 'ENTRADA', 0.0);

-- Registrar salida de broca
SELECT FUN_INS_TAB_MOVIMIENTO_DE_BROCA('BROCA-001', 1, NOW(), 'SALIDA', 50.0);
```

#### 3. Consultar Datos

```sql
-- Ver todas las brocas
SELECT * FROM FUN_CONS_TAB_BROCAS();

-- Ver estado de inventario
SELECT 
    ESTADO_BROCA, 
    COUNT(*) as CANTIDAD
FROM TAB_BROCAINSTANCIADAS
GROUP BY ESTADO_BROCA;

-- Ver movimientos de una broca
SELECT * FROM TAB_MOVIMIENTO_DE_BROCA 
WHERE ID_BROCA_INSTANCIADA = 'BROCA-001'
ORDER BY FECHA_HORA_MOVIMIENTO DESC;
```

#### 4. Analizar Rendimiento

```sql
-- Ejecutar estadísticas
-- Ver archivo: ESTADISTICAS/01_ESTADISTICAS_RENDIMIENTO_BROCAS.SQL
-- Copiar y ejecutar Query 1 para top brocas por profundidad
```

## 📚 Guía Rápida

### Preguntas Comunes y Cómo Responderlas

| Pregunta | Archivo | Query |
|----------|---------|-------|
| ¿Cuál broca perfora más? | 01_RENDIMIENTO | #1 |
| ¿Cuál broca es más eficiente? | 01_RENDIMIENTO | #2 |
| ¿Cuál broca dura más? | 01_RENDIMIENTO | #3 |
| ¿Mejor broca para arcilla? | 02_SUELOS | #4 |
| ¿Mejor broca para arena? | 02_SUELOS | #4 |
| ¿Dónde se usa más BROCA-001? | 03_LOCALIDADES | #2 |
| ¿Cuántas brocas nuevas hay? | 05_DASHBOARD | KPIs |
| ¿Cuántas brocas están dañadas? | 05_DASHBOARD | Recomendaciones |
| ¿Vida útil de cada broca? | 04_DESGASTE | #3 |

### Verificación de Datos Cargados

Después de ejecutar SETUP_TEST_DATA.SQL:

```bash
psql -U postgres -d PerforacionZ -f VERIFICAR_DATOS.SQL
```

Debería mostrar:
- ✓ 4 departamentos
- ✓ 10 municipios
- ✓ 5 supervisores
- ✓ 7 tipos de suelo
- ✓ 10 modelos de brocas
- ✓ 40 instancias de brocas (BROCA-001 a BROCA-040)
- ✓ 3 proyectos
- ✓ 15 perforaciones
- ✓ 60 movimientos de brocas
- ✓ 30 tramos de suelo

## 🔐 Seguridad y Mejores Prácticas

- **Backups**: Realizar backups regulares de la base de datos
  ```bash
  pg_dump -U postgres PerforacionZ > backup_$(date +%Y%m%d).sql
  ```

- **Usuarios**: Crear usuarios específicos con permisos limitados
  ```sql
  CREATE USER perforacionz_user WITH PASSWORD 'contraseña_segura';
  GRANT CONNECT ON DATABASE PerforacionZ TO perforacionz_user;
  GRANT USAGE ON SCHEMA public TO perforacionz_user;
  ```

- **Logs**: PostgreSQL registra cambios automáticamente vía `USUARIO_CREACION` y `USUARIO_MODIFICACION`

## 📝 Mantenimiento

### Tareas Periódicas

1. **Actualizar estado de brocas** cuando se dañen
   ```sql
   SELECT FUN_UPD_TAB_BROCAINSTANCIADAS('BROCA-001', NULL, 'DAÑADA', NULL);
   ```

2. **Archivar datos antiguos** (> 1 año)
   ```sql
   DELETE FROM TAB_MOVIMIENTO_DE_BROCA 
   WHERE FECHA_HORA_MOVIMIENTO < NOW() - INTERVAL '1 year';
   ```

3. **Revisar alertas** desde 05_DASHBOARD_RESUMEN_GENERAL.SQL

## 🤝 Contribuir

Para añadir nuevas funcionalidades:

1. Crear rama: `git checkout -b feature/nueva-funcionalidad`
2. Hacer cambios y commit
3. Enviar pull request

## 📞 Soporte

Para problemas o preguntas:

- **Issues**: Abrir issue en GitHub
- **Email**: [estebanjaniot10@gmail.com]
- **Documentación**: Ver archivos README.md en cada carpeta

## 📄 Licencia

[Especificar licencia: MIT, Apache 2.0, etc.]

## 📅 Versión

- **v1.0.0-beta** - Mayo 2026 (EN DESARROLLO)
  - Sistema base completo
  - 10 tablas funcionales
  - 40 brocas en inventario
  - 6 análisis estadísticos
  - Script de setup automático
  - ✨ **NUEVO**: Funciones de eliminación de brocas
  - ✨ **NUEVO**: Consultas avanzadas de brocas por supervisor (versión jerárquica y simple)

---

**Última actualización**: Mayo 14, 2026

**Autor**: SrJaniot

**Estado**: 🚧 En Desarrollo (Beta)

**Roadmap**:
- [ ] Validación completa de todas las funciones
- [ ] Pruebas de carga con datos reales
- [ ] Optimización de queries de estadísticas
- [ ] API REST (próxima fase)
- [ ] Dashboard web (próxima fase)
