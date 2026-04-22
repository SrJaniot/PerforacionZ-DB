-- PRUEBAS para TAB_PERFORACIONES
-- Suite completa de pruebas para las funciones de perforaciones

-- ============================================================
-- PRUEBAS PARA: FUN_VALIDAR_PERFORACIONES
-- ============================================================

-- Prueba 1.1: Validación exitosa
SELECT 'PRUEBA 1.1: Validación exitosa' as PRUEBA;
SELECT FUN_VALIDAR_PERFORACIONES(
    1,
    100.50,
    '2026-04-10 08:00:00'::TIMESTAMP
) as RESULTADO;

-- Prueba 1.2: ID_PROYECTO inexistente - DEBE FALLAR
SELECT 'PRUEBA 1.2: ID_PROYECTO inexistente - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_PERFORACIONES(
    999,
    100.50,
    '2026-04-10 08:00:00'::TIMESTAMP
) as RESULTADO;

-- Prueba 1.3: PROFUNDIDAD_ACTUAL negativa - DEBE FALLAR
SELECT 'PRUEBA 1.3: PROFUNDIDAD_ACTUAL negativa - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_PERFORACIONES(
    1,
    -50.0,
    '2026-04-10 08:00:00'::TIMESTAMP
) as RESULTADO;

-- Prueba 1.4: FECHA_INICIO_PERFORACION en el futuro - DEBE FALLAR
SELECT 'PRUEBA 1.4: FECHA_INICIO en futuro - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_PERFORACIONES(
    1,
    100.50,
    '2099-04-10 08:00:00'::TIMESTAMP
) as RESULTADO;

-- ============================================================
-- PRUEBAS PARA: FUN_INSERTAR_PERFORACIONES_JSON
-- ============================================================

-- Prueba 2.1: Inserción exitosa
SELECT 'PRUEBA 2.1: Inserción exitosa' as PRUEBA;
SELECT FUN_INSERTAR_PERFORACIONES_JSON(
    1,
    75.80,
    '2026-04-10 10:00:00'::TIMESTAMP,
    'desarrollo'
) as RESULTADO;

-- Prueba 2.2: Inserción con proyecto inválido - DEBE FALLAR
SELECT 'PRUEBA 2.2: Proyecto inválido - DEBE FALLAR' as PRUEBA;
SELECT FUN_INSERTAR_PERFORACIONES_JSON(
    999,
    75.80,
    '2026-04-10 10:00:00'::TIMESTAMP,
    'desarrollo'
) as RESULTADO;

-- ============================================================
-- PRUEBAS PARA: FUN_ACTUALIZAR_PERFORACIONES_JSON
-- ============================================================

-- Prueba 3.1: Actualización exitosa
SELECT 'PRUEBA 3.1: Actualización exitosa' as PRUEBA;
SELECT FUN_ACTUALIZAR_PERFORACIONES_JSON(
    1,
    1,
    150.25,
    '2026-04-10 08:00:00'::TIMESTAMP,
    '2026-04-14 17:00:00'::TIMESTAMP,
    'desarrollo'
) as RESULTADO;

-- Prueba 3.2: Actualización con ID inexistente - DEBE FALLAR
SELECT 'PRUEBA 3.2: ID inexistente - DEBE FALLAR' as PRUEBA;
SELECT FUN_ACTUALIZAR_PERFORACIONES_JSON(
    999,
    1,
    100.0,
    '2026-04-10 08:00:00'::TIMESTAMP,
    NULL,
    'desarrollo'
) as RESULTADO;

-- ============================================================
-- PRUEBAS PARA: FUN_OBTENER_PERFORACION_POR_ID_JSON
-- ============================================================

-- Prueba 4.1: Obtener perforación existente
SELECT 'PRUEBA 4.1: Obtener perforación existente' as PRUEBA;
SELECT FUN_OBTENER_PERFORACION_POR_ID_JSON(1) as RESULTADO;

-- Prueba 4.2: Obtener perforación inexistente
SELECT 'PRUEBA 4.2: Obtener perforación inexistente' as PRUEBA;
SELECT FUN_OBTENER_PERFORACION_POR_ID_JSON(999) as RESULTADO;

-- ============================================================
-- PRUEBAS PARA: FUN_OBTENER_TODAS_PERFORACIONES_JSON
-- ============================================================

-- Prueba 5.1: Obtener todas las perforaciones
SELECT 'PRUEBA 5.1: Obtener todas las perforaciones' as PRUEBA;
SELECT FUN_OBTENER_TODAS_PERFORACIONES_JSON() as RESULTADO;
