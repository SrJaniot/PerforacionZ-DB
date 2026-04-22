/*
================================================================================
GUÍA RÁPIDA: CONSULTAS COMUNES Y ÚTILES
================================================================================
Este archivo contiene ejemplos de consultas frecuentes que puedes ejecutar
directamente para obtener información específica sobre brocas y operaciones.

Cada consulta está etiquetada y puedes ejecutarlas independientemente.
================================================================================
*/

-- ═══════════════════════════════════════════════════════════════════════════
-- 1. CONSULTAS DE USO FRECUENTE
-- ═══════════════════════════════════════════════════════════════════════════

-- 📌 PREGUNTA: ¿Cuál es mi broca ESTRELLA (mejor rendimiento)?
SELECT 
    '🏆 BROCA ESTRELLA DEL SISTEMA' AS TITULO,
    b.NOM_BROCA AS NOMBRE,
    b.TIPO_BROCA AS TIPO,
    'Tamaño: ' || b.TAMANIO_BROCA || 'mm | Matriz: ' || b.MATRIX_BROCA AS ESPECIFICACIONES,
    COUNT(DISTINCT bi.ID_BROCA_INSTANCIADA) AS INSTANCIAS,
    ROUND(SUM(ts.PROFUNDIDAD_FIN - ts.PROFUNDIDAD_INICIO)::NUMERIC, 2) AS METROS_PERFORADOS_TOTAL,
    ROUND(AVG(ts.PROFUNDIDAD_FIN - ts.PROFUNDIDAD_INICIO)::NUMERIC, 2) AS PROFUNDIDAD_PROMEDIO_POR_TRAMO,
    COUNT(DISTINCT mb.ID_PERFORACION) AS PERFORACIONES_COMPLETADAS
FROM 
    TAB_BROCAS b
    LEFT JOIN TAB_BROCAINSTANCIADAS bi ON b.ID_BROCA = bi.ID_BROCA
    LEFT JOIN TAB_MOVIMIENTO_DE_BROCA mb ON bi.ID_BROCA_INSTANCIADA = mb.ID_BROCA_INSTANCIADA
    LEFT JOIN TAB_PERFORACIONES p ON mb.ID_PERFORACION = p.ID_PERFORACION
    LEFT JOIN TAB_TRAMO_SUELO ts ON p.ID_PERFORACION = ts.ID_PERFORACION
GROUP BY 
    b.ID_BROCA, b.NOM_BROCA, b.TIPO_BROCA, b.TAMANIO_BROCA, b.MATRIX_BROCA
HAVING 
    SUM(ts.PROFUNDIDAD_FIN - ts.PROFUNDIDAD_INICIO) IS NOT NULL
ORDER BY 
    METROS_PERFORADOS_TOTAL DESC
LIMIT 1;

-- ───────────────────────────────────────────────────────────────────────────

-- 📌 PREGUNTA: ¿Cuáles son mis brocas DAÑADAS que necesitan reemplazo?
SELECT 
    '🔴 BROCAS DAÑADAS - ACCIÓN REQUERIDA' AS ESTADO,
    bi.ID_BROCA_INSTANCIADA AS SERIE,
    b.NOM_BROCA AS MODELO,
    bi.ESTADO_BROCA AS ESTADO,
    bi.FECHA_REGISTRO_BROCA AS FECHA_ENTRADA,
    bi.FECHA_ÚLTIMO_USO_BROCA AS ÚLTIMA_ACTIVIDAD,
    COUNT(DISTINCT mb.ID_MOVIMIENTO) AS MOVIMIENTOS_REALIZADOS,
    EXTRACT(DAY FROM (bi.FECHA_ÚLTIMO_USO_BROCA - bi.FECHA_REGISTRO_BROCA)) AS DÍAS_EN_USO
FROM 
    TAB_BROCAINSTANCIADAS bi
    LEFT JOIN TAB_BROCAS b ON bi.ID_BROCA = b.ID_BROCA
    LEFT JOIN TAB_MOVIMIENTO_DE_BROCA mb ON bi.ID_BROCA_INSTANCIADA = mb.ID_BROCA_INSTANCIADA
WHERE 
    bi.ESTADO_BROCA = 'DAÑADA'
GROUP BY 
    bi.ID_BROCA_INSTANCIADA, b.NOM_BROCA, bi.ESTADO_BROCA, 
    bi.FECHA_REGISTRO_BROCA, bi.FECHA_ÚLTIMO_USO_BROCA
ORDER BY 
    bi.FECHA_REGISTRO_BROCA DESC;

-- ───────────────────────────────────────────────────────────────────────────

-- 📌 PREGUNTA: ¿Tengo suficientes brocas NUEVAS disponibles?
SELECT 
    '🆕 INVENTARIO DISPONIBLE' AS TIPO,
    COUNT(DISTINCT bi.ID_BROCA_INSTANCIADA) AS CANTIDAD_BROCAS_NUEVAS,
    COUNT(DISTINCT bi.ID_BROCA) AS MODELOS_DIFERENTES,
    STRING_AGG(DISTINCT b.NOM_BROCA, ', ' ORDER BY b.NOM_BROCA) AS MODELOS_DISPONIBLES,
    'Lista para el siguiente proyecto' AS ESTADO
FROM 
    TAB_BROCAINSTANCIADAS bi
    LEFT JOIN TAB_BROCAS b ON bi.ID_BROCA = b.ID_BROCA
WHERE 
    bi.ESTADO_BROCA = 'NUEVA';

-- ───────────────────────────────────────────────────────────────────────────

-- 📌 PREGUNTA: ¿Qué broca uso para este tipo de suelo?
-- (Ejemplo: cambia 'ARCILLA' por el tipo de suelo que necesites)
SELECT 
    '✅ RECOMENDACIÓN DE BROCA PARA SUELO: ARCILLA' AS RECOMENDACIÓN,
    b.NOM_BROCA AS MEJOR_OPCIÓN,
    b.TIPO_BROCA AS TIPO,
    'Tamaño: ' || b.TAMANIO_BROCA || 'mm | Matriz: ' || b.MATRIX_BROCA AS DETALLES,
    ROUND(AVG(ts.PROFUNDIDAD_FIN - ts.PROFUNDIDAD_INICIO)::NUMERIC, 2) || ' metros promedio' AS RENDIMIENTO,
    COUNT(DISTINCT ts.ID_TRAMO) || ' tramos completados' AS EXPERIENCIA,
    ROUND((COUNT(DISTINCT ts.ID_TRAMO)::NUMERIC / NULLIF(COUNT(DISTINCT bi.ID_BROCA_INSTANCIADA), 0))::NUMERIC, 1) || ' tramos por instancia' AS EFICIENCIA
FROM 
    TAB_BROCAS b
    LEFT JOIN TAB_BROCAINSTANCIADAS bi ON b.ID_BROCA = bi.ID_BROCA
    LEFT JOIN TAB_MOVIMIENTO_DE_BROCA mb ON bi.ID_BROCA_INSTANCIADA = mb.ID_BROCA_INSTANCIADA
    LEFT JOIN TAB_PERFORACIONES p ON mb.ID_PERFORACION = p.ID_PERFORACION
    LEFT JOIN TAB_TRAMO_SUELO ts ON p.ID_PERFORACION = ts.ID_PERFORACION
    LEFT JOIN TAB_SUELOS s ON ts.ID_SUELO = s.ID_SUELO
WHERE 
    s.TIPO_SUELO = 'ARCILLA'
GROUP BY 
    b.ID_BROCA, b.NOM_BROCA, b.TIPO_BROCA, b.TAMANIO_BROCA, b.MATRIX_BROCA
ORDER BY 
    AVG(ts.PROFUNDIDAD_FIN - ts.PROFUNDIDAD_INICIO) DESC
LIMIT 1;

-- ───────────────────────────────────────────────────────────────────────────

-- 📌 PREGUNTA: ¿Dónde estoy usando más brocas? (Geográficamente)
SELECT 
    '📍 TOP 5 MUNICIPIOS POR ACTIVIDAD' AS METRICA,
    m.NOM_MUNICIPIO AS MUNICIPIO,
    d.NOM_DPTO AS DEPARTAMENTO,
    COUNT(DISTINCT p.ID_PERFORACION) || ' perforaciones' AS ACTIVIDAD,
    COUNT(DISTINCT bi.ID_BROCA_INSTANCIADA) || ' brocas usadas' AS RECURSOS,
    ROUND(SUM(ts.PROFUNDIDAD_FIN - ts.PROFUNDIDAD_INICIO)::NUMERIC, 2) || ' m' AS PROFUNDIDAD_TOTAL
FROM 
    TAB_MUNICIPIOS m
    LEFT JOIN TAB_DPTOS d ON m.ID_DPTO = d.ID_DPTO
    LEFT JOIN TAB_PROYECTOS pr ON m.ID_MUNICIPIO = pr.ID_MUNICIPIO
    LEFT JOIN TAB_PERFORACIONES p ON pr.ID_PROYECTO = p.ID_PROYECTO
    LEFT JOIN TAB_MOVIMIENTO_DE_BROCA mb ON p.ID_PERFORACION = mb.ID_PERFORACION
    LEFT JOIN TAB_BROCAINSTANCIADAS bi ON mb.ID_BROCA_INSTANCIADA = bi.ID_BROCA_INSTANCIADA
    LEFT JOIN TAB_TRAMO_SUELO ts ON p.ID_PERFORACION = ts.ID_PERFORACION
GROUP BY 
    m.ID_MUNICIPIO, m.NOM_MUNICIPIO, d.NOM_DPTO
HAVING 
    COUNT(DISTINCT p.ID_PERFORACION) > 0
ORDER BY 
    COUNT(DISTINCT p.ID_PERFORACION) DESC
LIMIT 5;

-- ═══════════════════════════════════════════════════════════════════════════
-- 2. CONSULTAS DE MONITOREO
-- ═══════════════════════════════════════════════════════════════════════════

-- 📌 ESTADO DEL INVENTARIO COMPLETO (Resumen por estado)
SELECT 
    '📦 INVENTARIO POR ESTADO' AS CATEGORIA,
    bi.ESTADO_BROCA AS ESTADO,
    COUNT(DISTINCT bi.ID_BROCA_INSTANCIADA) AS CANTIDAD,
    ROUND((COUNT(DISTINCT bi.ID_BROCA_INSTANCIADA)::NUMERIC / 
           (SELECT COUNT(*) FROM TAB_BROCAINSTANCIADAS) * 100)::NUMERIC, 1)::VARCHAR || '%' AS PORCENTAJE,
    CASE 
        WHEN bi.ESTADO_BROCA = 'EN_USO' THEN '✅ Activas'
        WHEN bi.ESTADO_BROCA = 'NUEVA' THEN '🆕 Disponibles'
        WHEN bi.ESTADO_BROCA = 'DAÑADA' THEN '🔴 Requieren acción'
        ELSE '❌ Descartadas'
    END AS ESTADO_VISUAL
FROM 
    TAB_BROCAINSTANCIADAS bi
GROUP BY 
    bi.ESTADO_BROCA
ORDER BY 
    CANTIDAD DESC;

-- ───────────────────────────────────────────────────────────────────────────

-- 📌 BROCAS EN SERVICIO PROLONGADO (Necesitan mantenimiento)
SELECT 
    '⚠️ BROCAS EN SERVICIO PROLONGADO' AS ALERTA,
    bi.ID_BROCA_INSTANCIADA AS SERIE,
    b.NOM_BROCA AS MODELO,
    COUNT(DISTINCT mb.ID_MOVIMIENTO) AS MOVIMIENTOS_TOTALES,
    ROUND((COUNT(DISTINCT mb.ID_MOVIMIENTO)::NUMERIC / 
           NULLIF(EXTRACT(DAY FROM (bi.FECHA_ÚLTIMO_USO_BROCA - bi.FECHA_REGISTRO_BROCA)), 0))::NUMERIC, 2) AS MOVIMIENTOS_POR_DÍA,
    EXTRACT(DAY FROM (CURRENT_DATE - bi.FECHA_ÚLTIMO_USO_BROCA)) || ' días sin usar' AS INACTIVIDAD
FROM 
    TAB_BROCAINSTANCIADAS bi
    LEFT JOIN TAB_BROCAS b ON bi.ID_BROCA = b.ID_BROCA
    LEFT JOIN TAB_MOVIMIENTO_DE_BROCA mb ON bi.ID_BROCA_INSTANCIADA = mb.ID_BROCA_INSTANCIADA
WHERE 
    bi.ESTADO_BROCA = 'EN_USO'
    AND COUNT(DISTINCT mb.ID_MOVIMIENTO) > 20
GROUP BY 
    bi.ID_BROCA_INSTANCIADA, b.NOM_BROCA, bi.FECHA_REGISTRO_BROCA, bi.FECHA_ÚLTIMO_USO_BROCA
HAVING 
    COUNT(DISTINCT mb.ID_MOVIMIENTO) > 20
ORDER BY 
    COUNT(DISTINCT mb.ID_MOVIMIENTO) DESC;

-- ═══════════════════════════════════════════════════════════════════════════
-- 3. CONSULTAS DE ANÁLISIS RÁPIDO
-- ═══════════════════════════════════════════════════════════════════════════

-- 📌 COMPARATIVA RÁPIDA: TODAS LAS BROCAS EN UN VISTAZO
SELECT 
    b.NOM_BROCA AS BROCA,
    COUNT(DISTINCT bi.ID_BROCA_INSTANCIADA) || ' piezas' AS INVENTARIO,
    COUNT(DISTINCT CASE WHEN bi.ESTADO_BROCA = 'EN_USO' THEN bi.ID_BROCA_INSTANCIADA END) || ' activas' AS ESTADO,
    ROUND(AVG(ts.PROFUNDIDAD_FIN - ts.PROFUNDIDAD_INICIO)::NUMERIC, 1)::VARCHAR || ' m/tramo' AS RENDIMIENTO,
    ROUND((SUM(ts.PROFUNDIDAD_FIN - ts.PROFUNDIDAD_INICIO) / 
           NULLIF(COUNT(DISTINCT bi.ID_BROCA_INSTANCIADA), 0))::NUMERIC, 0)::VARCHAR || ' m/pieza' AS PRODUCTIVIDAD
FROM 
    TAB_BROCAS b
    LEFT JOIN TAB_BROCAINSTANCIADAS bi ON b.ID_BROCA = bi.ID_BROCA
    LEFT JOIN TAB_MOVIMIENTO_DE_BROCA mb ON bi.ID_BROCA_INSTANCIADA = mb.ID_BROCA_INSTANCIADA
    LEFT JOIN TAB_PERFORACIONES p ON mb.ID_PERFORACION = p.ID_PERFORACION
    LEFT JOIN TAB_TRAMO_SUELO ts ON p.ID_PERFORACION = ts.ID_PERFORACION
GROUP BY 
    b.ID_BROCA, b.NOM_BROCA
ORDER BY 
    COUNT(DISTINCT bi.ID_BROCA_INSTANCIADA) DESC;

-- ───────────────────────────────────────────────────────────────────────────

-- 📌 SUELO MÁS DIFÍCIL DE PERFORAR (Menor promedio = más difícil)
SELECT 
    '⛏️ SUELO MÁS DIFÍCIL DE PERFORAR' AS CHALLENGE,
    s.NOM_SUELO AS SUELO,
    s.DESCRIPCION_SUELO AS DESCRIPCIÓN,
    COUNT(DISTINCT ts.ID_TRAMO) || ' tramos' AS EXPERIENCIA,
    ROUND(AVG(ts.PROFUNDIDAD_FIN - ts.PROFUNDIDAD_INICIO)::NUMERIC, 2) || ' metros' AS PROMEDIO_PROFUNDIDAD,
    CASE 
        WHEN AVG(ts.PROFUNDIDAD_FIN - ts.PROFUNDIDAD_INICIO) > 50 THEN 'FÁCIL ✅'
        WHEN AVG(ts.PROFUNDIDAD_FIN - ts.PROFUNDIDAD_INICIO) BETWEEN 20 AND 50 THEN 'MEDIO 🟡'
        WHEN AVG(ts.PROFUNDIDAD_FIN - ts.PROFUNDIDAD_INICIO) BETWEEN 10 AND 20 THEN 'DIFÍCIL 🔴'
        ELSE 'MUY DIFÍCIL 🔴🔴'
    END AS DIFICULTAD
FROM 
    TAB_SUELOS s
    LEFT JOIN TAB_TRAMO_SUELO ts ON s.ID_SUELO = ts.ID_SUELO
GROUP BY 
    s.ID_SUELO, s.NOM_SUELO, s.DESCRIPCION_SUELO
HAVING 
    COUNT(DISTINCT ts.ID_TRAMO) > 0
ORDER BY 
    AVG(ts.PROFUNDIDAD_FIN - ts.PROFUNDIDAD_INICIO) ASC
LIMIT 1;

-- ═══════════════════════════════════════════════════════════════════════════
-- 4. CONSULTAS DE DECISIÓN RÁPIDA
-- ═══════════════════════════════════════════════════════════════════════════

-- 📌 ¿PUEDO USAR LA BROCA X PARA EL PROYECTO Y?
-- (Ejemplo: Cambiar 'BROCA-001' por la serie real y '1' por ID proyecto)
SELECT 
    '✓ ANÁLISIS DE COMPATIBILIDAD' AS RESULTADO,
    bi.ID_BROCA_INSTANCIADA AS BROCA,
    b.NOM_BROCA AS MODELO,
    pr.NOM_PROYECTO AS PROYECTO,
    CASE 
        WHEN bi.ESTADO_BROCA = 'NUEVA' THEN '✅ Disponible y lista'
        WHEN bi.ESTADO_BROCA = 'EN_USO' THEN '🟡 En uso, podría liberarse'
        ELSE '❌ No disponible'
    END AS DISPONIBILIDAD,
    STRING_AGG(DISTINCT s.TIPO_SUELO, ', ' ORDER BY s.TIPO_SUELO) AS SUELOS_DEL_PROYECTO,
    ROUND(MAX(p.PROFUNDIDAD_ACTUAL)::NUMERIC, 2) || ' metros' AS PROFUNDIDAD_REQUERIDA
FROM 
    TAB_BROCAINSTANCIADAS bi
    LEFT JOIN TAB_BROCAS b ON bi.ID_BROCA = b.ID_BROCA
    LEFT JOIN TAB_PROYECTOS pr ON pr.ID_PROYECTO = 1  -- CAMBIAR ID_PROYECTO
    LEFT JOIN TAB_PERFORACIONES p ON pr.ID_PROYECTO = p.ID_PROYECTO
    LEFT JOIN TAB_MOVIMIENTO_DE_BROCA mb ON bi.ID_BROCA_INSTANCIADA = mb.ID_BROCA_INSTANCIADA
    LEFT JOIN TAB_TRAMO_SUELO ts ON p.ID_PERFORACION = ts.ID_PERFORACION
    LEFT JOIN TAB_SUELOS s ON ts.ID_SUELO = s.ID_SUELO
WHERE 
    bi.ID_BROCA_INSTANCIADA = 'BROCA-001'  -- CAMBIAR SERIE DE BROCA
GROUP BY 
    bi.ID_BROCA_INSTANCIADA, b.NOM_BROCA, pr.NOM_PROYECTO, bi.ESTADO_BROCA;

-- ═══════════════════════════════════════════════════════════════════════════
-- 5. NOTAS DE USO
-- ═══════════════════════════════════════════════════════════════════════════

/*
💡 INSTRUCCIONES DE USO:

1. EDITAR PARÁMETROS:
   - Las consultas tienen comentarios indicando qué cambiar
   - Ej: "-- CAMBIAR 'ARCILLA' por el tipo de suelo"
   - Modifica los valores entre comillas según necesidad

2. EJECUTAR CONSULTAS:
   - Cada consulta está separada por "---"
   - Selecciona una consulta completa
   - Presiona Ctrl+Enter o ejecuta en PGAdmin

3. GUARDAR RESULTADOS:
   - Puedes exportar a CSV, Excel, JSON desde PGAdmin
   - Click derecho en resultados → Export

4. CREAR REPORTES:
   - Combina varias consultas en un script nuevo
   - Guarda como "MI_REPORTE_PERSONALIZADO.SQL"
   - Reutiliza cuando necesites los mismos datos

5. AUTOMATIZAR:
   - Copia la query
   - Crea una tarea programada que ejecute regularmente
   - Exporta resultados automáticamente

═══════════════════════════════════════════════════════════════════════════════
ÚLTIMA ACTUALIZACIÓN: 2026-04-21
VERSION: 1.0
═══════════════════════════════════════════════════════════════════════════════
*/
