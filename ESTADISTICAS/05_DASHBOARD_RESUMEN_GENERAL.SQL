/*
================================================================================
DASHBOARD GENERAL DE ESTADÍSTICAS - RESUMEN EJECUTIVO
================================================================================
Resumen general y KPIs principales del sistema de perforación
Incluye: volumen de operaciones, eficiencia, estado del inventario, y tendencias
================================================================================
*/

-- ═══════════════════════════════════════════════════════════════════════════
-- 1. INDICADORES CLAVE DE DESEMPEÑO (KPIs)
-- ═══════════════════════════════════════════════════════════════════════════

-- Total de Proyectos
SELECT 'Total de Proyectos'::VARCHAR AS MÉTRICA, COUNT(*)::VARCHAR AS VALOR FROM TAB_PROYECTOS
UNION ALL
-- Total de Perforaciones
SELECT 'Total de Perforaciones'::VARCHAR, COUNT(*)::VARCHAR FROM TAB_PERFORACIONES
UNION ALL
-- Total de Movimientos
SELECT 'Total de Movimientos Registrados'::VARCHAR, COUNT(*)::VARCHAR FROM TAB_MOVIMIENTO_DE_BROCA
UNION ALL
-- Profundidad Total
SELECT 'Profundidad Total Perforada'::VARCHAR, 
  ROUND(SUM(PROFUNDIDAD_FIN - PROFUNDIDAD_INICIO)::NUMERIC, 2)::VARCHAR || ' metros' FROM TAB_TRAMO_SUELO
UNION ALL
-- Modelos de Brocas
SELECT 'Modelos de Brocas Disponibles'::VARCHAR, COUNT(DISTINCT ID_BROCA)::VARCHAR FROM TAB_BROCAS
UNION ALL
-- Instancias Totales
SELECT 'Instancias Totales de Brocas'::VARCHAR, COUNT(*)::VARCHAR FROM TAB_BROCAINSTANCIADAS
UNION ALL
-- Brocas en Uso
SELECT 'Brocas Actualmente EN_USO'::VARCHAR, COUNT(*)::VARCHAR FROM TAB_BROCAINSTANCIADAS WHERE ESTADO_BROCA = 'EN_USO'
UNION ALL
-- Brocas Nuevas
SELECT 'Brocas NUEVAS (Sin Usar)'::VARCHAR, COUNT(*)::VARCHAR FROM TAB_BROCAINSTANCIADAS WHERE ESTADO_BROCA = 'NUEVA'
UNION ALL
-- Brocas Dañadas
SELECT 'Brocas DAÑADAS'::VARCHAR, COUNT(*)::VARCHAR FROM TAB_BROCAINSTANCIADAS WHERE ESTADO_BROCA = 'DAÑADA'
UNION ALL
-- Brocas Descartadas  
SELECT 'Brocas DESCARTADAS'::VARCHAR, COUNT(*)::VARCHAR FROM TAB_BROCAINSTANCIADAS WHERE ESTADO_BROCA = 'DESCARTADA';

-- ═══════════════════════════════════════════════════════════════════════════
-- 2. TOP 5 BROCAS MÁS PRODUCTIVAS (Por profundidad total perforada)
-- ═══════════════════════════════════════════════════════════════════════════
SELECT 
    RANK() OVER (ORDER BY SUM(ts.PROFUNDIDAD_FIN - ts.PROFUNDIDAD_INICIO) DESC)::VARCHAR || '. ' ||
    b.NOM_BROCA || ' | Tipo: ' || b.TIPO_BROCA || ' | Tamaño: ' || b.TAMANIO_BROCA || 'mm' AS BROCA,
    ROUND(SUM(ts.PROFUNDIDAD_FIN - ts.PROFUNDIDAD_INICIO)::NUMERIC, 2)::VARCHAR || ' m' AS TOTAL_PERFORADO,
    COUNT(DISTINCT bi.ID_BROCA_INSTANCIADA)::VARCHAR AS INSTANCIAS
FROM 
    TAB_BROCAS b
    LEFT JOIN TAB_BROCAINSTANCIADAS bi ON b.ID_BROCA = bi.ID_BROCA
    LEFT JOIN TAB_MOVIMIENTO_DE_BROCA mb ON bi.ID_BROCA_INSTANCIADA = mb.ID_BROCA_INSTANCIADA
    LEFT JOIN TAB_PERFORACIONES p ON mb.ID_PERFORACION = p.ID_PERFORACION
    LEFT JOIN TAB_TRAMO_SUELO ts ON p.ID_PERFORACION = ts.ID_PERFORACION
GROUP BY 
    b.ID_BROCA, b.NOM_BROCA, b.TIPO_BROCA, b.TAMANIO_BROCA
HAVING 
    SUM(ts.PROFUNDIDAD_FIN - ts.PROFUNDIDAD_INICIO) IS NOT NULL
ORDER BY 
    SUM(ts.PROFUNDIDAD_FIN - ts.PROFUNDIDAD_INICIO) DESC
LIMIT 5;

-- ═══════════════════════════════════════════════════════════════════════════
-- 3. TOP 5 MUNICIPIOS CON MAYOR ACTIVIDAD
-- ═══════════════════════════════════════════════════════════════════════════
SELECT 
    RANK() OVER (ORDER BY COUNT(DISTINCT p.ID_PERFORACION) DESC)::VARCHAR || '. ' ||
    m.NOM_MUNICIPIO || ' (' || d.NOM_DPTO || ')' AS UBICACIÓN,
    COUNT(DISTINCT pr.ID_PROYECTO)::VARCHAR AS PROYECTOS,
    COUNT(DISTINCT p.ID_PERFORACION)::VARCHAR AS PERFORACIONES,
    ROUND(SUM(ts.PROFUNDIDAD_FIN - ts.PROFUNDIDAD_INICIO)::NUMERIC, 2)::VARCHAR || ' m' AS PERFORADO
FROM 
    TAB_MUNICIPIOS m
    LEFT JOIN TAB_DPTOS d ON m.ID_DPTO = d.ID_DPTO
    LEFT JOIN TAB_PROYECTOS pr ON m.ID_MUNICIPIO = pr.ID_MUNICIPIO
    LEFT JOIN TAB_PERFORACIONES p ON pr.ID_PROYECTO = p.ID_PROYECTO
    LEFT JOIN TAB_MOVIMIENTO_DE_BROCA mb ON p.ID_PERFORACION = mb.ID_PERFORACION
    LEFT JOIN TAB_TRAMO_SUELO ts ON p.ID_PERFORACION = ts.ID_PERFORACION
GROUP BY 
    m.ID_MUNICIPIO, m.NOM_MUNICIPIO, d.NOM_DPTO
HAVING 
    COUNT(DISTINCT p.ID_PERFORACION) > 0
ORDER BY 
    COUNT(DISTINCT p.ID_PERFORACION) DESC
LIMIT 5;

-- ═══════════════════════════════════════════════════════════════════════════
-- 4. ANÁLISIS DE SUELOS (Dificultad por profundidad promedio)
-- ═══════════════════════════════════════════════════════════════════════════
SELECT 
    s.NOM_SUELO || ' (' || s.TIPO_SUELO || ')' AS TIPO_SUELO,
    COUNT(DISTINCT ts.ID_TRAMO)::VARCHAR AS TRAMOS,
    ROUND(AVG(ts.PROFUNDIDAD_FIN - ts.PROFUNDIDAD_INICIO)::NUMERIC, 2)::VARCHAR || ' m' AS PROMEDIO,
    CASE 
        WHEN AVG(ts.PROFUNDIDAD_FIN - ts.PROFUNDIDAD_INICIO) > 50 THEN '⭐ Fácil'
        WHEN AVG(ts.PROFUNDIDAD_FIN - ts.PROFUNDIDAD_INICIO) BETWEEN 20 AND 50 THEN '⭐⭐ Medio'
        WHEN AVG(ts.PROFUNDIDAD_FIN - ts.PROFUNDIDAD_INICIO) BETWEEN 10 AND 20 THEN '⭐⭐⭐ Difícil'
        ELSE '⭐⭐⭐⭐ Muy Difícil'
    END AS DIFICULTAD
FROM 
    TAB_SUELOS s
    LEFT JOIN TAB_TRAMO_SUELO ts ON s.ID_SUELO = ts.ID_SUELO
GROUP BY 
    s.ID_SUELO, s.NOM_SUELO, s.TIPO_SUELO
HAVING 
    COUNT(DISTINCT ts.ID_TRAMO) > 0
ORDER BY 
    AVG(ts.PROFUNDIDAD_FIN - ts.PROFUNDIDAD_INICIO) DESC;

-- ═══════════════════════════════════════════════════════════════════════════
-- 5. RECOMENDACIONES DEL SISTEMA
-- ═══════════════════════════════════════════════════════════════════════════

-- Brocas Dañadas
SELECT 'ALERTA: Brocas Dañadas'::VARCHAR AS RECOMENDACIÓN, COUNT(*)::VARCHAR AS CANTIDAD
FROM TAB_BROCAINSTANCIADAS
WHERE ESTADO_BROCA = 'DAÑADA'
UNION ALL
-- Brocas Nuevas Disponibles
SELECT 'INFO: Brocas NUEVAS disponibles'::VARCHAR, COUNT(*)::VARCHAR
FROM TAB_BROCAINSTANCIADAS
WHERE ESTADO_BROCA = 'NUEVA'
UNION ALL
-- Tasa de Utilización
SELECT 'MÉTRICA: Tasa de Utilización'::VARCHAR,
  ROUND((COUNT(CASE WHEN ESTADO_BROCA IN ('EN_USO', 'DAÑADA') THEN 1 END)::NUMERIC / 
         NULLIF(COUNT(*), 0) * 100), 2)::VARCHAR || '%'
FROM TAB_BROCAINSTANCIADAS;
