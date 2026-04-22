-- PRUEBAS para TAB_MOVIMIENTO_DE_BROCA
-- Suite completa de pruebas para las funciones de movimientos de broca

-- ============================================================
-- PRUEBAS PARA: FUN_VALIDAR_MOVIMIENTO_DE_BROCA
-- ============================================================

-- Prueba 1.1: Validación exitosa
SELECT 'PRUEBA 1.1: Validación exitosa' as PRUEBA;
SELECT FUN_VALIDAR_MOVIMIENTO_DE_BROCA(
    1,
    1,
    '2026-04-10 08:30:00'::TIMESTAMP,
    'ENTRADA',
    50.0
) as RESULTADO;

-- Prueba 1.2: ID_BROCA_INSTANCIADA inexistente - DEBE FALLAR
SELECT 'PRUEBA 1.2: ID_BROCA_INSTANCIADA inexistente - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_MOVIMIENTO_DE_BROCA(
    999,
    1,
    '2026-04-10 08:30:00'::TIMESTAMP,
    'ENTRADA',
    50.0
) as RESULTADO;

-- Prueba 1.3: ID_PERFORACION inexistente - DEBE FALLAR
SELECT 'PRUEBA 1.3: ID_PERFORACION inexistente - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_MOVIMIENTO_DE_BROCA(
    1,
    999,
    '2026-04-10 08:30:00'::TIMESTAMP,
    'ENTRADA',
    50.0
) as RESULTADO;

-- Prueba 1.4: TIPO_MOVIMIENTO inválido - DEBE FALLAR
SELECT 'PRUEBA 1.4: TIPO_MOVIMIENTO inválido - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_MOVIMIENTO_DE_BROCA(
    1,
    1,
    '2026-04-10 08:30:00'::TIMESTAMP,
    'TIPO_INVALIDO',
    50.0
) as RESULTADO;

-- Prueba 1.5: PROFUNDIDAD_MOVIMIENTO negativa - DEBE FALLAR
SELECT 'PRUEBA 1.5: PROFUNDIDAD_MOVIMIENTO negativa - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_MOVIMIENTO_DE_BROCA(
    1,
    1,
    '2026-04-10 08:30:00'::TIMESTAMP,
    'ENTRADA',
    -50.0
) as RESULTADO;

-- Prueba 1.6: FECHA_HORA_MOVIMIENTO en el futuro - DEBE FALLAR
SELECT 'PRUEBA 1.6: FECHA_HORA_MOVIMIENTO en el futuro - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_MOVIMIENTO_DE_BROCA(
    1,
    1,
    '2030-12-31 08:30:00'::TIMESTAMP,
    'ENTRADA',
    50.0
) as RESULTADO;

-- ============================================================
-- PRUEBAS PARA: FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON
-- ============================================================

-- Prueba 2.1: Inserción exitosa
SELECT 'PRUEBA 2.1: Inserción exitosa' as PRUEBA;
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON(
    1,
    1,
    '2026-04-10 10:00:00'::TIMESTAMP,
    'ENTRADA',
    0.0,
    'desarrollo'
) as RESULTADO;

-- Prueba 2.2: Inserción con broca instanciada inválida - DEBE FALLAR
SELECT 'PRUEBA 2.2: Broca instanciada inválida - DEBE FALLAR' as PRUEBA;
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON(
    999,
    1,
    '2026-04-10 10:00:00'::TIMESTAMP,
    'ENTRADA',
    0.0,
    'desarrollo'
) as RESULTADO;

-- Prueba 2.3: Segunda inserción - SALIDA en profundidad mayor (progresivo)
SELECT 'PRUEBA 2.3: Segunda inserción - SALIDA en profundidad 125.5 (progresivo)' as PRUEBA;
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON(
    1,
    1,
    '2026-04-10 12:00:00'::TIMESTAMP,
    'SALIDA',
    125.5,
    'desarrollo'
) as RESULTADO;

-- Prueba 2.4: Tercera inserción - intenta ENTRADA en profundidad MENOR que la última (DEBE FALLAR)
SELECT 'PRUEBA 2.4: Tercera inserción - ENTRADA en profundidad 100.0 MENOR que última 125.5 (DEBE FALLAR)' as PRUEBA;
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON(
    1,
    1,
    '2026-04-10 14:00:00'::TIMESTAMP,
    'ENTRADA',
    100.0,
    'desarrollo'
) as RESULTADO;

-- Prueba 2.5: Cuarta inserción - ENTRADA en profundidad IGUAL a la última (DEBE PASAR)
SELECT 'PRUEBA 2.5: Cuarta inserción - ENTRADA en profundidad 125.5 IGUAL a última (DEBE PASAR)' as PRUEBA;
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON(
    1,
    1,
    '2026-04-10 14:30:00'::TIMESTAMP,
    'ENTRADA',
    125.5,
    'desarrollo'
) as RESULTADO;

-- Prueba 2.6: Quinta inserción - SALIDA en profundidad MAYOR (DEBE PASAR)
SELECT 'PRUEBA 2.6: Quinta inserción - SALIDA en profundidad 200.0 MAYOR que última (DEBE PASAR)' as PRUEBA;
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON(
    1,
    1,
    '2026-04-10 15:00:00'::TIMESTAMP,
    'SALIDA',
    200.0,
    'desarrollo'
) as RESULTADO;

-- Prueba 2.7: Inserción en diferente perforación con la misma broca - profundidad menor (DEBE PASAR)
SELECT 'PRUEBA 2.7: Misma broca, diferente perforación - profundidad menor (DEBE PASAR)' as PRUEBA;
SELECT FUN_INSERTAR_MOVIMIENTO_DE_BROCA_JSON(
    1,
    2,
    '2026-04-10 16:00:00'::TIMESTAMP,
    'ENTRADA',
    0.0,
    'desarrollo'
) as RESULTADO;

-- Prueba 2.8: Verificar que PROFUNDIDAD_ACTUAL se actualiza en TAB_PERFORACIONES después de inserción
SELECT 'PRUEBA 2.8: Verificar PROFUNDIDAD_ACTUAL actualizada después de inserción' as PRUEBA;
SELECT ID_PERFORACION, PROFUNDIDAD_ACTUAL FROM TAB_PERFORACIONES WHERE ID_PERFORACION IN (1, 2) ORDER BY ID_PERFORACION;

-- ============================================================
-- PRUEBAS PARA: FUN_ACTUALIZAR_MOVIMIENTO_DE_BROCA_JSON
-- ============================================================

-- Prueba 3.1: Actualización exitosa
SELECT 'PRUEBA 3.1: Actualización exitosa' as PRUEBA;
SELECT FUN_ACTUALIZAR_MOVIMIENTO_DE_BROCA_JSON(
    1,
    1,
    1,
    '2026-04-10 08:30:00'::TIMESTAMP,
    'SALIDA',
    125.50,
    'desarrollo'
) as RESULTADO;

-- Prueba 3.2: Actualización con ID inexistente - DEBE FALLAR
SELECT 'PRUEBA 3.2: ID inexistente - DEBE FALLAR' as PRUEBA;
SELECT FUN_ACTUALIZAR_MOVIMIENTO_DE_BROCA_JSON(
    999,
    1,
    1,
    '2026-04-10 08:30:00'::TIMESTAMP,
    'ENTRADA',
    50.0,
    'desarrollo'
) as RESULTADO;

-- Prueba 3.3: Actualización intentando violar profundidad progresiva - PROFUNDIDAD menor (DEBE FALLAR)
SELECT 'PRUEBA 3.3: Actualización - profundidad menor que última de la broca en perforación (DEBE FALLAR)' as PRUEBA;
SELECT FUN_ACTUALIZAR_MOVIMIENTO_DE_BROCA_JSON(
    1,
    1,
    1,
    '2026-04-10 08:30:00'::TIMESTAMP,
    'ENTRADA',
    50.0,
    'desarrollo'
) as RESULTADO;

-- Prueba 3.4: Actualización válida - mantener o aumentar profundidad (DEBE PASAR)
SELECT 'PRUEBA 3.4: Actualización válida - mantener profundidad adecuada (DEBE PASAR)' as PRUEBA;
SELECT FUN_ACTUALIZAR_MOVIMIENTO_DE_BROCA_JSON(
    1,
    1,
    1,
    '2026-04-10 08:30:00'::TIMESTAMP,
    'SALIDA',
    125.50,
    'desarrollo'
) as RESULTADO;
-- Prueba 3.5: Verificar que PROFUNDIDAD_ACTUAL se actualiza en TAB_PERFORACIONES después de actualización
SELECT 'PRUEBA 3.5: Verificar PROFUNDIDAD_ACTUAL actualizada después de actualización' as PRUEBA;
SELECT ID_PERFORACION, PROFUNDIDAD_ACTUAL FROM TAB_PERFORACIONES WHERE ID_PERFORACION = 1;
-- ============================================================
-- PRUEBAS PARA: FUN_OBTENER_MOVIMIENTO_DE_BROCA_POR_ID_JSON
-- ============================================================

-- Prueba 4.1: Obtener movimiento existente
SELECT 'PRUEBA 4.1: Obtener movimiento existente' as PRUEBA;
SELECT FUN_OBTENER_MOVIMIENTO_DE_BROCA_POR_ID_JSON(1) as RESULTADO;

-- Prueba 4.2: Obtener movimiento inexistente
SELECT 'PRUEBA 4.2: Obtener movimiento inexistente' as PRUEBA;
SELECT FUN_OBTENER_MOVIMIENTO_DE_BROCA_POR_ID_JSON(999) as RESULTADO;

-- ============================================================
-- PRUEBAS PARA: FUN_OBTENER_TODOS_MOVIMIENTOS_DE_BROCA_JSON
-- ============================================================

-- Prueba 5.1: Obtener todos los movimientos de broca
SELECT 'PRUEBA 5.1: Obtener todos los movimientos' as PRUEBA;
SELECT FUN_OBTENER_TODOS_MOVIMIENTOS_DE_BROCA_JSON() as RESULTADO;
