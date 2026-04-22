-- PRUEBAS para TAB_TRAMO_SUELO
-- Suite completa de pruebas para las funciones de tramo suelo

-- ============================================================
-- PRUEBAS PARA: FUN_VALIDAR_TRAMO_SUELO
-- ============================================================

-- Prueba 1.1: Validación exitosa
SELECT 'PRUEBA 1.1: Validación exitosa' as PRUEBA;
SELECT FUN_VALIDAR_TRAMO_SUELO(
    1,
    1,
    0.0,
    25.50
) as RESULTADO;

-- Prueba 1.2: ID_PERFORACION inexistente - DEBE FALLAR
SELECT 'PRUEBA 1.2: ID_PERFORACION inexistente - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_TRAMO_SUELO(
    999,
    1,
    0.0,
    25.50
) as RESULTADO;

-- Prueba 1.3: ID_SUELO inexistente - DEBE FALLAR
SELECT 'PRUEBA 1.3: ID_SUELO inexistente - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_TRAMO_SUELO(
    1,
    999,
    0.0,
    25.50
) as RESULTADO;

-- Prueba 1.4: PROFUNDIDAD_FIN menor que PROFUNDIDAD_INICIO - DEBE FALLAR
SELECT 'PRUEBA 1.4: PROFUNDIDAD_FIN < PROFUNDIDAD_INICIO - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_TRAMO_SUELO(
    1,
    1,
    25.50,
    0.0
) as RESULTADO;

-- Prueba 1.5: PROFUNDIDAD_FIN igual a PROFUNDIDAD_INICIO - DEBE FALLAR
SELECT 'PRUEBA 1.5: PROFUNDIDAD_FIN = PROFUNDIDAD_INICIO - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_TRAMO_SUELO(
    1,
    1,
    25.50,
    25.50
) as RESULTADO;

-- Prueba 1.6: PROFUNDIDAD_INICIO negativa - DEBE FALLAR
SELECT 'PRUEBA 1.6: PROFUNDIDAD_INICIO negativa - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_TRAMO_SUELO(
    1,
    1,
    -10.0,
    25.50
) as RESULTADO;

-- ============================================================
-- PRUEBAS PARA: FUN_INSERTAR_TRAMO_SUELO_JSON
-- ============================================================

-- Prueba 2.1: Inserción exitosa
SELECT 'PRUEBA 2.1: Inserción exitosa' as PRUEBA;
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(
    1,
    1,
    0.0,
    20.0,
    'desarrollo'
) as RESULTADO;

-- Prueba 2.2: Inserción con perforación inválida - DEBE FALLAR
SELECT 'PRUEBA 2.2: Perforación inválida - DEBE FALLAR' as PRUEBA;
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(
    999,
    1,
    0.0,
    20.0,
    'desarrollo'
) as RESULTADO;

-- Prueba 2.3: Segunda inserción - tramo siguiente (PROFUNDIDAD_INICIO >= última PROFUNDIDAD_FIN)
SELECT 'PRUEBA 2.3: Segunda inserción - tramo 20.0 a 35.0 (progresivo)' as PRUEBA;
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(
    1,
    2,
    20.0,
    35.0,
    'desarrollo'
) as RESULTADO;

-- Prueba 2.4: Tercera inserción - intenta PROFUNDIDAD_INICIO MENOR que última PROFUNDIDAD_FIN (DEBE FALLAR)
SELECT 'PRUEBA 2.4: Tercera inserción - tramo 30.0 a 45.0 MENOR que última FIN (35.0) - DEBE FALLAR' as PRUEBA;
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(
    1,
    3,
    30.0,
    45.0,
    'desarrollo'
) as RESULTADO;

-- Prueba 2.5: Cuarta inserción - PROFUNDIDAD_INICIO IGUAL a última PROFUNDIDAD_FIN (DEBE PASAR)
SELECT 'PRUEBA 2.5: Cuarta inserción - tramo 35.0 a 50.0 IGUAL a última FIN (DEBE PASAR)' as PRUEBA;
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(
    1,
    3,
    35.0,
    50.0,
    'desarrollo'
) as RESULTADO;

-- Prueba 2.6: Quinta inserción - PROFUNDIDAD_INICIO MAYOR que última PROFUNDIDAD_FIN (DEBE PASAR)
SELECT 'PRUEBA 2.6: Quinta inserción - tramo 60.0 a 75.0 MAYOR que última FIN (DEBE PASAR)' as PRUEBA;
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(
    1,
    4,
    60.0,
    75.0,
    'desarrollo'
) as RESULTADO;

-- Prueba 2.7: Inserción en diferente perforación - profundidad menor permitida (DEBE PASAR)
SELECT 'PRUEBA 2.7: Diferente perforación - tramo desde 0.0 (DEBE PASAR)' as PRUEBA;
SELECT FUN_INSERTAR_TRAMO_SUELO_JSON(
    2,
    1,
    0.0,
    15.0,
    'desarrollo'
) as RESULTADO;

-- ============================================================
-- PRUEBAS PARA: FUN_ACTUALIZAR_TRAMO_SUELO_JSON
-- ============================================================

-- Prueba 3.1: Actualización exitosa
SELECT 'PRUEBA 3.1: Actualización exitosa' as PRUEBA;
SELECT FUN_ACTUALIZAR_TRAMO_SUELO_JSON(
    1,
    1,
    2,
    0.0,
    30.0,
    'desarrollo'
) as RESULTADO;

-- Prueba 3.2: Actualización con ID inexistente - DEBE FALLAR
SELECT 'PRUEBA 3.2: ID inexistente - DEBE FALLAR' as PRUEBA;
SELECT FUN_ACTUALIZAR_TRAMO_SUELO_JSON(
    999,
    1,
    1,
    0.0,
    25.50,
    'desarrollo'
) as RESULTADO;

-- Prueba 3.3: Actualización intentando violar progresión - PROFUNDIDAD_INICIO menor (DEBE FALLAR)
SELECT 'PRUEBA 3.3: Actualización - PROFUNDIDAD_INICIO menor que última FIN (DEBE FALLAR)' as PRUEBA;
SELECT FUN_ACTUALIZAR_TRAMO_SUELO_JSON(
    1,
    1,
    1,
    10.0,
    25.50,
    'desarrollo'
) as RESULTADO;

-- Prueba 3.4: Actualización válida - mantener o aumentar profundidad (DEBE PASAR)
SELECT 'PRUEBA 3.4: Actualización válida - mantener profundidad adecuada (DEBE PASAR)' as PRUEBA;
SELECT FUN_ACTUALIZAR_TRAMO_SUELO_JSON(
    1,
    1,
    1,
    0.0,
    22.0,
    'desarrollo'
) as RESULTADO;

-- ============================================================
-- PRUEBAS PARA: FUN_OBTENER_TRAMO_SUELO_POR_ID_JSON
-- ============================================================

-- Prueba 4.1: Obtener tramo suelo existente
SELECT 'PRUEBA 4.1: Obtener tramo suelo existente' as PRUEBA;
SELECT FUN_OBTENER_TRAMO_SUELO_POR_ID_JSON(1) as RESULTADO;

-- Prueba 4.2: Obtener tramo suelo inexistente
SELECT 'PRUEBA 4.2: Obtener tramo suelo inexistente' as PRUEBA;
SELECT FUN_OBTENER_TRAMO_SUELO_POR_ID_JSON(999) as RESULTADO;

-- ============================================================
-- PRUEBAS PARA: FUN_OBTENER_TODOS_TRAMOS_SUELO_JSON
-- ============================================================

-- Prueba 5.1: Obtener todos los tramos suelo
SELECT 'PRUEBA 5.1: Obtener todos los tramos suelo' as PRUEBA;
SELECT FUN_OBTENER_TODOS_TRAMOS_SUELO_JSON() as RESULTADO;
