# Changelog

Todos los cambios notables de este proyecto se documentarán en este archivo.

El formato se basa en [Keep a Changelog](https://keepachangelog.com/es-ES/1.0.0/),
y este proyecto adhiere al [Versionado Semántico](https://semver.org/lang/es/).

## [1.0.0-beta] - 2026-05-14

### 🆕 Añadido

#### Funciones de Eliminación
- **FUN_ELIMINAR_BROCA_POR_ID_JSON**: Elimina un modelo de broca de la base de datos
  - Retorna JSON con status: `{CODIGO, MENSAJE}`
  - Solo elimina si la broca no está siendo usada en instancias
  - Validación automática de existencia

- **FUN_ELIMINAR_BROCAINSTANCIADA_POR_ID_JSON**: Elimina una broca del inventario
  - Retorna JSON con status: `{CODIGO, MENSAJE}`
  - Elimina la instancia de broca (e.g., BROCA-001)
  - Permite limpieza de inventario

#### Consultas Avanzadas de Brocas por Supervisor

**FUN_OBTENER_BROCAS_POR_SUPERVISOR_JSON** (Versión Jerárquica)
- Estructura anidada: Supervisor → Proyectos → Perforaciones → Brocas
- Retorna el **último movimiento** de cada broca
- Ideal para análisis detallado y visualización en dashboards
- Campos completos: ID, nombre, tipo, marca, tamaño, estado
- Metadata de movimiento: tipo (ENTRADA/SALIDA), profundidad, fecha/hora

**FUN_OBTENER_BROCAS_POR_SUPERVISOR_SIMPLE_JSON** (Versión Plana)
- Lista plana de todas las brocas del supervisor
- Retorna el **último movimiento** de cada broca
- Ideal para reportes, exportación, análisis simples
- Mejor performance para consultas sin anidamiento
- Mismos campos que versión jerárquica, formato más simple

Ambas versiones:
- Validan existencia del supervisor
- Incluyen metadata completa de brocas desde TAB_BROCAS
- Retornan JSON con estructura: `{CODIGO, MENSAJE, DATOS}`
- Manejo de errores: 400 (datos inválidos), 404 (no encontrado), 200 (éxito)

#### Campos Agregados en Brocas
- **MARCA_BROCA**: Marca del fabricante (Smith Services, Baker Hughes, Halliburton, etc)
- Ahora disponible en todas las consultas de brocas

### 📝 Cambios

- Actualización de versión a 1.0.0-beta (Mayo 2026)
- Documentación mejorada en README.md
- Añadida sección de "Últimas Novedades" en README

### 📁 Estructura

Funciones disponibles en:
- [FUNCIONES/FUN_BROCAINSTANCIADAS/FUN_TAB_BROCAINSTANCIADAS.SQL](FUNCIONES/FUN_BROCAINSTANCIADAS/FUN_TAB_BROCAINSTANCIADAS.SQL) *(en prueba)*

**Estado**: Las nuevas funciones están en prueba en el archivo dedicado. Serán agregadas a SETUP_CLEAN_DB.SQL una vez validadas.

---

## [1.0.0-alpha] - 2026-04-15

### 🆕 Añadido (Versión Inicial)

- Sistema base de gestión de brocas y perforaciones
- 10 tablas principales de base de datos
- Funciones CRUD para todas las tablas
- 40 instancias de brocas (BROCA-001 a BROCA-040)
- Scripts de setup automático (PowerShell, Bash)
- 6 análisis estadísticos avanzados
- Sistema de auditoría (campos USUARIO_CREACION, USUARIO_MODIFICACION)

### 📊 Estadísticas Incluidas

1. Rendimiento de brocas (profundidad, eficiencia, durabilidad)
2. Efectividad por tipo de suelo
3. Distribución geográfica por municipio/departamento
4. Análisis de consumo y desgaste
5. Dashboard ejecutivo con KPIs
6. Análisis comparativo avanzado

### 🔧 Funcionalidades Base

- Gestión de departamentos y municipios
- Gestión de supervisores
- Gestión de tipos de suelo
- Gestión de proyectos y perforaciones
- Inventario de brocas instanciadas (40 unidades)
- Registro de movimientos de brocas (entradas/salidas)
- Trazabilidad completa de uso

---

## Convenciones

### Tipos de Cambios

- **🆕 Añadido**: Nuevas funcionalidades
- **📝 Cambio**: Cambios en funcionalidades existentes
- **🐛 Arreglado**: Corrección de bugs
- **⚠️ Deprecado**: Funcionalidades que serán removidas
- **🗑️ Removido**: Funcionalidades removidas

### Estado de Funciones

- ✅ **Activo/Producción**: En SETUP_CLEAN_DB.SQL
- 🧪 **En Prueba**: En archivo dedicado, bajo testing
- ⚠️ **Deprecado**: Será removido próximamente
- 🔄 **En Desarrollo**: Próximamente

---

## Roadmap

### Próximas Versiones

- **v1.1.0** (Junio 2026)
  - [ ] Validación completa de todas las funciones
  - [ ] Pruebas de carga con datos reales
  - [ ] Optimización de queries de estadísticas
  - [ ] Reporte de bugs y mejoras

- **v1.5.0** (Julio 2026)
  - [ ] API REST (endpoints para CRUD)
  - [ ] Autenticación y autorización
  - [ ] Sistema de roles y permisos

- **v2.0.0** (Agosto 2026)
  - [ ] Dashboard web reactivo
  - [ ] Gráficos en tiempo real
  - [ ] Exportación de reportes (PDF, Excel)
  - [ ] Mobile app

---

## Cómo Contribuir

Para reportar bugs o sugerir mejoras:

1. Abrir issue en GitHub con descripción clara
2. Especificar versión y pasos para reproducir
3. Enviar pull request con cambios propuestos
4. Asegurar que todas las pruebas pasen

---

**Mantenedor**: SrJaniot  
**Última revisión**: Mayo 14, 2026
