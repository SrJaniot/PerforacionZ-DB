-- PRUEBAS para TAB_BROCAINSTANCIADAS
-- Suite completa de pruebas para las funciones de brocas instanciadas

-- ============================================================
-- PRUEBAS PARA: FUN_VALIDAR_BROCAINSTANCIADAS
-- ============================================================

-- Prueba 1.1: Validación exitosa
SELECT 'PRUEBA 1.1: Validación exitosa' as PRUEBA;
SELECT FUN_VALIDAR_BROCAINSTANCIADAS(
    1,
    'NUEVA',
    '2026-04-10 08:00:00'::TIMESTAMP
) as RESULTADO;

-- Prueba 1.2: ID_BROCA inexistente - DEBE FALLAR
SELECT 'PRUEBA 1.2: ID_BROCA inexistente - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_BROCAINSTANCIADAS(
    999,
    'NUEVA',
    '2026-04-10 08:00:00'::TIMESTAMP
) as RESULTADO;

-- Prueba 1.3: ESTADO_BROCA inválido - DEBE FALLAR
SELECT 'PRUEBA 1.3: ESTADO_BROCA inválido - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_BROCAINSTANCIADAS(
    1,
    'ESTADO_INVALIDO',
    '2026-04-10 08:00:00'::TIMESTAMP
) as RESULTADO;

-- Prueba 1.4: FECHA_REGISTRO_BROCA en futuro - DEBE FALLAR
SELECT 'PRUEBA 1.4: FECHA_REGISTRO en futuro - DEBE FALLAR' as PRUEBA;
SELECT FUN_VALIDAR_BROCAINSTANCIADAS(
    1,
    'NUEVA',
    '2099-04-10 08:00:00'::TIMESTAMP
) as RESULTADO;

-- ============================================================
-- PRUEBAS PARA: FUN_INSERTAR_BROCAINSTANCIADAS_JSON
-- ============================================================

-- Prueba 2.1: Inserción exitosa
SELECT 'PRUEBA 2.1: Inserción exitosa' as PRUEBA;
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON(
    2,
    'NUEVA',
    '2026-04-10 08:00:00'::TIMESTAMP,
    'desarrollo'
) as RESULTADO;

-- Prueba 2.2: Inserción con broca inválida - DEBE FALLAR
SELECT 'PRUEBA 2.2: Broca inválida - DEBE FALLAR' as PRUEBA;
SELECT FUN_INSERTAR_BROCAINSTANCIADAS_JSON(
    999,
    'NUEVA',
    '2026-04-10 08:00:00'::TIMESTAMP,
    'desarrollo'
) as RESULTADO;

-- ============================================================
-- PRUEBAS PARA: FUN_ACTUALIZAR_BROCAINSTANCIADAS_JSON
-- ============================================================

-- Prueba 3.1: Actualización exitosa
SELECT 'PRUEBA 3.1: Actualización exitosa' as PRUEBA;
SELECT FUN_ACTUALIZAR_BROCAINSTANCIADAS_JSON(
    1,
    1,
    'EN_USO',
    '2026-03-15 10:00:00'::TIMESTAMP,
    '2026-04-12 16:30:00'::TIMESTAMP,
    'desarrollo'
) as RESULTADO;

-- Prueba 3.2: Actualización con ID inexistente - DEBE FALLAR
SELECT 'PRUEBA 3.2: ID inexistente - DEBE FALLAR' as PRUEBA;
SELECT FUN_ACTUALIZAR_BROCAINSTANCIADAS_JSON(
    999,
    1,
    'NUEVA',
    '2026-04-10 08:00:00'::TIMESTAMP,
    NULL,
    'desarrollo'
) as RESULTADO;

-- ============================================================
-- PRUEBAS PARA: FUN_OBTENER_BROCAINSTANCIADA_POR_ID_JSON
-- ============================================================

-- Prueba 4.1: Obtener broca instanciada existente
SELECT 'PRUEBA 4.1: Obtener broca instanciada existente' as PRUEBA;
SELECT FUN_OBTENER_BROCAINSTANCIADA_POR_ID_JSON(1) as RESULTADO;

-- Prueba 4.2: Obtener broca instanciada inexistente
SELECT 'PRUEBA 4.2: Obtener broca instanciada inexistente' as PRUEBA;
SELECT FUN_OBTENER_BROCAINSTANCIADA_POR_ID_JSON(999) as RESULTADO;

-- ============================================================
-- PRUEBAS PARA: FUN_OBTENER_TODAS_BROCASINSTANCIADAS_JSON
-- ============================================================

-- Prueba 5.1: Obtener todas las brocas instanciadas
SELECT 'PRUEBA 5.1: Obtener todas las brocas instanciadas' as PRUEBA;
SELECT FUN_OBTENER_TODAS_BROCASINSTANCIADAS_JSON() as RESULTADO;
