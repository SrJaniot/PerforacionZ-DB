# 🤝 Guía de Contribución - PerforacionZ

Gracias por tu interés en contribuir a **PerforacionZ**. Este documento te guiará en el proceso.

## 📋 Tabla de Contenidos

- [Código de Conducta](#código-de-conducta)
- [Cómo Contribuir](#cómo-contribuir)
- [Reportar Bugs](#reportar-bugs)
- [Sugerir Mejoras](#sugerir-mejoras)
- [Pull Requests](#pull-requests)
- [Estándares de Código](#estándares-de-código)
- [Proceso de Review](#proceso-de-review)

## 💼 Código de Conducta

Este proyecto se adhiere a los estándares de conducta profesional:

- Sé respetuoso con otros contribuidores
- Acepta crítica constructiva
- Enfócate en lo mejor para la comunidad
- Reporta comportamientos inapropiados

## 🎯 Cómo Contribuir

### Contribuciones Bienvenidas

- 🐛 **Bug fixes**: Correcciones de errores
- ✨ **Features**: Nuevas funcionalidades
- 📚 **Documentación**: Mejoras en README y comentarios
- 🧪 **Tests**: Pruebas unitarias y de integración
- ⚡ **Performance**: Optimizaciones de queries
- 🔒 **Seguridad**: Mejoras de seguridad

### Áreas Prioritarias

1. **Validación de Datos**: Implementar validaciones en funciones CRUD
2. **Tests Unitarios**: Pruebas para todas las funciones
3. **Optimización**: Queries más eficientes para estadísticas
4. **Documentación**: Ejemplos más detallados
5. **Escalabilidad**: Soporte para más de 40 brocas

## 🐛 Reportar Bugs

### Antes de Reportar

- Busca en issues existentes
- Verifica que sea reproducible
- Prueba con la versión más reciente

### Información Necesaria

```
Título: [Breve descripción del bug]

Descripción:
- Qué esperabas que ocurra
- Qué ocurre realmente
- Pasos para reproducir

Contexto:
- Versión de PerforacionZ: (ej: v1.0.0-beta)
- PostgreSQL versión: (ej: 13.0)
- Sistema Operativo: (ej: Windows 10)

Logs/Errores:
[Pega aquí los mensajes de error completos]
```

### Ejemplo de Reporte

```
Título: Error en FUN_INS_TAB_BROCAS al insertar broca con caracteres especiales

Descripción:
Esperaba insertar una broca con nombre "Broca-X™", pero recibí error de codificación.

Pasos para reproducir:
1. Ejecutar: SELECT FUN_INS_TAB_BROCAS('Broca-X™', 'Diamante', 5.0, 'Acero', 'Test');
2. Ver error: ERROR: invalid byte sequence for encoding "UTF8"

Contexto:
- PerforacionZ: v1.0.0-beta
- PostgreSQL: 12.0
- SO: Ubuntu 20.04
```

## 💡 Sugerir Mejoras

### Proceso

1. Usa el título descriptivo: `[FEATURE]` título de la mejora
2. Proporciona descripción detallada
3. Lista ejemplos de casos de uso
4. Menciona por qué sería beneficioso

### Ejemplo

```
[FEATURE] Agregar histórico de cambios de estado de brocas

Descripción:
Sería útil tener registro de cuándo cambió cada broca de estado 
(NUEVA → EN_USO → DAÑADA, etc).

Casos de uso:
- Auditoría de cambios
- Análisis de vida útil
- Reportes históricos

Beneficios:
- Mayor trazabilidad
- Mejor análisis de desgaste
```

## 🔄 Pull Requests

### Antes de Hacer un PR

1. **Fork** el repositorio
2. **Crea rama** desde `develop`:
   ```bash
   git checkout -b feature/nombre-feature
   ```
3. **Haz cambios** y commits descriptivos
4. **Verifica** tu código localmente
5. **Push** a tu fork
6. **Abre PR** hacia `develop`

### Título del PR

```
[TIPO] Descripción corta

Tipos:
- [BUGFIX] - Corrección de errores
- [FEATURE] - Nueva funcionalidad
- [DOCS] - Cambios en documentación
- [REFACTOR] - Mejora de código existente
- [PERF] - Mejoras de rendimiento
```

### Descripción del PR

```markdown
## Descripción
[Qué cambios hace este PR]

## Tipo de Cambio
- [ ] Bug fix
- [ ] Nuevo feature
- [ ] Breaking change
- [ ] Cambio en documentación

## Cómo se Probó
[Explica cómo verificaste que funciona]

## Checklist
- [ ] Mi código sigue los estándares de este proyecto
- [ ] He actualizado la documentación relevante
- [ ] He añadido tests si es aplicable
- [ ] Mis cambios no generan nuevos warnings
- [ ] He verificado que funciona en PostgreSQL 12+

## Relacionado
Cierra #[número de issue]
```

### Ejemplo Completo

```markdown
## [BUGFIX] Corregir validación de TAMANIO_BROCA negativo

### Descripción
La función FUN_INS_TAB_BROCAS permite insertar brocas con tamaño negativo,
lo cual no tiene sentido físico.

### Cómo se Probó
```sql
-- Antes (fallaba):
SELECT FUN_INS_TAB_BROCAS('Prueba', 'Tipo', -5.0, 'Matriz', 'Desc');
-- ERROR: invalid size

-- Después (funciona):
SELECT FUN_INS_TAB_BROCAS('Prueba', 'Tipo', 5.0, 'Matriz', 'Desc');
-- QUERY EXECUTED
```

### Checklist
- [x] Código sigue estándares SQL
- [x] Validación añadida en función
- [x] Documentación actualizada
- [x] Sin nuevos warnings
- [x] Probado en PostgreSQL 12 y 13

Cierra #42
```

## 📝 Estándares de Código

### SQL

#### Convenciones de Nombres

```sql
-- Tablas: TAB_PLURAL_NOMBRE
CREATE TABLE TAB_USUARIOS (...)

-- Funciones: FUN_ACCION_TAB_NOMBRE
CREATE FUNCTION FUN_INS_TAB_USUARIOS(...) RETURNS ...

-- Variables: V_NOMBRE
DECLARE V_RESULTADO INTEGER;

-- Parámetros: P_NOMBRE
CREATE FUNCTION FUN_EJEMPLO(P_ID_USUARIO INTEGER, P_NOMBRE VARCHAR)

-- Índices: IDX_TABLA_CAMPO
CREATE INDEX IDX_USUARIOS_EMAIL ON TAB_USUARIOS(EMAIL);

-- Constraints: NOMBRE_TABLA_tipo_CAMPO
ALTER TABLE TAB_USUARIOS ADD CONSTRAINT FK_USUARIOS_DEPARTAMENTOS_ID_DPTO...
```

#### Formato

```sql
-- Comentarios de sección (80 caracteres)
-- ════════════════════════════════════════════════════════════════════════

-- Crear tabla con estructura clara
CREATE TABLE IF NOT EXISTS TAB_EJEMPLO (
    ID_EJEMPLO INTEGER PRIMARY KEY,
    NOMBRE VARCHAR NOT NULL,
    ESTADO VARCHAR DEFAULT 'ACTIVO',
    FECHA_CREACION TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    -- Constraints
    FOREIGN KEY (ID_PADRE) REFERENCES TAB_PADRE(ID_PADRE),
    UNIQUE(NOMBRE)
);

-- Función bien formateada
CREATE OR REPLACE FUNCTION FUN_INS_TAB_EJEMPLO(
    P_NOMBRE VARCHAR,
    P_ESTADO VARCHAR DEFAULT 'ACTIVO'
)
RETURNS INTEGER AS $$
DECLARE
    V_ID INTEGER;
BEGIN
    -- Insertar datos
    INSERT INTO TAB_EJEMPLO (NOMBRE, ESTADO)
    VALUES (P_NOMBRE, P_ESTADO)
    RETURNING ID_EJEMPLO INTO V_ID;
    
    RETURN V_ID;
    
EXCEPTION WHEN OTHERS THEN
    RAISE NOTICE 'Error en FUN_INS_TAB_EJEMPLO: %', SQLERRM;
    RETURN -1;
END;
$$ LANGUAGE plpgsql;
```

#### Mejores Prácticas SQL

- ✅ Usar alias descriptivos: `FROM TAB_USUARIOS U`
- ✅ Comentar lógica compleja
- ✅ Usar prepared statements (en aplicaciones)
- ✅ Validar parámetros en funciones
- ✅ Usar transactions para operaciones múltiples
- ❌ No usar SELECT * (específicar columnas)
- ❌ No confiar en orden de resultados sin ORDER BY
- ❌ No usar dynamic SQL sin validación

### Markdown

- Usar encabezados jerárquicos (#, ##, ###)
- Incluir ejemplos de código
- Mantener líneas < 100 caracteres
- Usar listas para enumerar
- Enlazar a secciones relevantes

### Commits

```bash
# Buen formato
git commit -m "feat: Agregar validación de tamaño de broca"
git commit -m "fix: Corregir typo en nombre de función"
git commit -m "docs: Actualizar guía de instalación"
git commit -m "refactor: Simplificar lógica de FUN_INS_TAB_BROCAS"

# Evitar
git commit -m "cambios"
git commit -m "fix todo"
git commit -m "asdasdasd"
```

## 🔍 Proceso de Review

### Qué Esperamos en un PR

1. **Código limpio**: Sin errores de sintaxis o lógica
2. **Documentación**: Comentarios y cambios en README
3. **Tests**: Pruebas que validen los cambios
4. **Compatibilidad**: Funciona en PostgreSQL 12+
5. **Performance**: Queries optimizadas

### Feedback del Revisor

- 📌 Preguntas sobre la lógica
- 💭 Sugerencias de mejora
- 🐛 Bugs identificados
- ✅ Aprobación y merge

### Ciclo de Revisión

1. Envías PR
2. Revisor solicita cambios (si es necesario)
3. Haces cambios
4. Revisor aprueba
5. Se hace merge a `develop`
6. Se prepara para release

## 📚 Recursos

- [Documentación PostgreSQL](https://www.postgresql.org/docs/)
- [Git Flow](https://nvie.com/posts/a-successful-git-branching-model/)
- [Conventional Commits](https://www.conventionalcommits.org/)
- [SQL Style Guide](https://www.sqlstyle.guide/)

## ❓ Preguntas?

- 📧 Email: [tu-email@ejemplo.com]
- 💬 Discussions: Abre una discusión en GitHub
- 🐦 Twitter: [@tu-usuario]

---

**¡Gracias por contribuir a PerforacionZ!** 🎉
